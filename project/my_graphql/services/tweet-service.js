const TweetRepository = require("../repositories/tweet-repository");

class TweetService {

    constructor() {

    }

    async findAll() {
        return await TweetRepository.findAll();
    }
    
    async findById(id) {
        return await TweetRepository.findById(id);
    }
    
    async count() {
        return await TweetRepository.count();
    }
    
    async save(text, userId) {
        return await TweetRepository.save(text, userId);
    }
    
    async deleteById(id) {
        return await TweetRepository.deleteById(id);
    }
    

}

module.exports = new TweetService();