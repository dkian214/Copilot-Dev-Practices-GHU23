module.exports = app => {
    const model = require("../controllers/model.controller.js");
  
    var router = require("express").Router();
  
    // Retrieve all Model
    router.get("/", model.findAll);
  
    // Retrieve a single Model with id
    router.get("/:id", model.findOne);
  
    // Update a Model with id
    router.put("/:id", model.update);
  
    // Delete a Model with id
    router.delete("/:id", model.delete);
  
    app.use('/api/model', router);
  };
  