const db = require("../data/db-config")

module.exports = {
    find,
    findById,
    findSteps,
    add,
    addStep,
    update,
    remove,
}

function find(){
    return db("schemes");
}

function findById(id){
    return db("schemes").where({ id }).first();
}

function findSteps(scheme_id){
    return db("steps").where({ scheme_id })
}

function add(scheme){
    return (
        db("schemes")
            .insert(scheme)
            .returning("id")
            .then(ids => {
                const id = ids[0];
                return findById(id);
            })
    );
}

function addStep(step, scheme_id){
    const steps = {
        ...step,
        scheme_id:scheme_id
    }

    return (
        db("steps")
            .insert(steps)
            .then(() => {
                return findSteps(scheme_id);
            })
    );
}

function update(changes, id){
    return db("schemes")
    .where({ id })
    .update(changes)
    .then(() => {
        return findById(id)
    });
}

function remove(id){
    return db("schemes").where({ id }).del();
}