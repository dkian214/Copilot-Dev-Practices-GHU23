#!/bin/bash

if [ -z "$PROJECTS_TOKEN" ]; then 
  echo "PROJECTS_TOKEN = NULL"
  exit 0
fi

source ./scripts/progress_env.sh

export GITHUB_TOKEN_BK=$GITHUB_TOKEN
export GITHUB_TOKEN=$PROJECTS_TOKEN
echo "TOKENS"
env | grep TOKEN
#env | grep TOKEN >> ./scripts/progress_setup.txt


export ISSUE_NUMBER=$(gh issue list -L 10000 -R $OWNER/$REPO --json number,title --jq '.[] | select(.title | contains(env.ISSUE_NAME)) | .number') && echo $ISSUE_NUMBER

if [ -z "$ISSUE_NUMBER" ]; then 
  gh api --header 'Accept: application/vnd.github+json' --method POST /repos/$OWNER/$REPO/issues -f title="$ISSUE_NAME" -f body="This is a test issue created by the REST API"  -f project_id=$PROJECT_ID -f state="in_progress"
else 
  echo "ISSUE Already Exists"; 
fi

export ISSUE_NUMBER=$(gh issue list -L 10000 -R $OWNER/$REPO --json number,title --jq '.[] | select(.title | contains(env.ISSUE_NAME)) | .number') && echo $ISSUE_NUMBER

export ISSUE_NUMBER=$(gh issue list -L 10000 -R $OWNER/$REPO --json number,title --jq '.[] | select(.title | contains(env.ISSUE_NAME)) | .number') && echo $ISSUE_NUMBER
export GRAPHQL="\
    query{\
    organization(login: OWNER){\
      projectV2(number: PROJECT_NUM) {\
        id\
      }\
    }\
  }";

echo "$GRAPHQL" && GRAPHQL=$(echo "$GRAPHQL" | sed -e 's/OWNER/'\""$OWNER"\"'/g') && echo "$GRAPHQL"
echo "$GRAPHQL" && GRAPHQL=$(echo "$GRAPHQL" | sed -e 's/PROJECT_NUM/'"$PROJECT_NUM"'/g') && echo "$GRAPHQL"

export PROJECT_ID=$(gh api graphql -f query="$GRAPHQL"  | jq '.data.organization.projectV2.id') && echo $PROJECT_ID

gh project item-add $PROJECT_NUM --owner $OWNER --url https://github.com/$OWNER/$REPO/issues/$ISSUE_NUMBER

export GRAPHQL="
  query{
    node(id: PROJECT_ID) {
        ... on ProjectV2 {
          items(first: 100) {
            nodes{
              id
              fieldValues(first: 100) {
                nodes{                
                  ... on ProjectV2ItemFieldTextValue {
                    text
                    field {
                      ... on ProjectV2FieldCommon {
                        name
                      }
                    }
                  }
                  ... on ProjectV2ItemFieldDateValue {
                    date
                    field {
                      ... on ProjectV2FieldCommon {
                        name
                      }
                    }
                  }
                  ... on ProjectV2ItemFieldSingleSelectValue {
                    name
                    field {
                      ... on ProjectV2FieldCommon {
                        name
                      }
                    }
                  }
                }              
              }
            }
          }
        }
      }
    }"
echo "$GRAPHQL" && GRAPHQL=$(echo "$GRAPHQL" | sed -e 's/PROJECT_ID/'"$PROJECT_ID"'/g') && echo "$GRAPHQL"    
export ISSUE_ID=$(gh api graphql -f query="$GRAPHQL" | jq '.data.node.items.nodes[] | select(.fieldValues.nodes[].text == env.ISSUE_NAME) | .id') && echo $ISSUE_ID

export GRAPHQL="
  query{
  node(id: PROJECT_ID) {
    ... on ProjectV2 {
      fields(first: 100) {
        nodes {
          ... on ProjectV2Field {
            id
            name
          }
          ... on ProjectV2IterationField {
            id
            name
            configuration {
              iterations {
                startDate
                id
              }
            }
          }
          ... on ProjectV2SingleSelectField {
            id
            name
            options {
              id
              name
            }
          }
        }
      }
    }
  }
}"

echo "$GRAPHQL" && GRAPHQL=$(echo "$GRAPHQL" | sed -e 's/PROJECT_ID/'"$PROJECT_ID"'/g') && echo "$GRAPHQL"

gh api graphql -f query="$GRAPHQL" > ./scripts/progress_project.json

export GRAPHQL="mutation { 
    updateProjectV2ItemFieldValue( 
      input: { 
        projectId: PROJECT_ID 
        itemId: ISSUE_ID
        fieldId: CUSTOM_FIELD_ID
        value: { 
          singleSelectOptionId: SELECTION_ID
        } 
      } 
    ) { 
      projectV2Item { 
        id 
      } 
    } 
  }"

echo "$GRAPHQL" && GRAPHQL=$(echo "$GRAPHQL" | sed -e 's/PROJECT_ID/'"$PROJECT_ID"'/g') && echo "$GRAPHQL"
echo "$GRAPHQL" && GRAPHQL=$(echo "$GRAPHQL" | sed -e 's/ISSUE_ID/'"$ISSUE_ID"'/g') && echo "$GRAPHQL"
echo "$GRAPHQL" && GRAPHQL=$(echo "$GRAPHQL" | sed -e 's/CUSTOM_FIELD_ID/'"$CUSTOM_FIELD_ID"'/g') && echo "$GRAPHQL"
echo "$GRAPHQL" && GRAPHQL=$(echo "$GRAPHQL" | sed -e 's/SELECTION_ID/'"$SELECTION_ID1"'/g') && echo "$GRAPHQL"

gh api graphql -f query="$GRAPHQL"

export GITHUB_TOKEN=$GITHUB_TOKEN_BK
echo "TOKENS"
env | grep TOKEN
