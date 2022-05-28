const UserRepository = require("../repositories/user-repository");

class UserService {

    constructor() {

    }

    async findAll() {
        return await UserRepository.findAll();
    }
    
    async findById(id) {
        return await UserRepository.findById(id);
    }
    
    async count() {
        return await UserRepository.count();
    }
    
    async save(username, firstName, lastName) {
        return await UserRepository.save();
    }
    
    async deleteById(id) {
        return await UserRepository.deleteById(id);
    }
    

}

module.exports = new UserService();