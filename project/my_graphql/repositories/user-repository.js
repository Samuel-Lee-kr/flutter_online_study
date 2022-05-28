const PostgresqlConnect = require("../db/postgresql-connect");

class UserRepository {

    constructor() {
        this.client = PostgresqlConnect.client;
    }

    async findAll() {
        let rows;
        try {
            const result = await this.client.query('SELECT * FROM tweet_user');
            rows = result.rows;
            console.log(rows);
        } catch (e) {
            return [];
        }
        return rows;
    }

    async findById(id) {
        let row;
        try {
            const result = await this.client.query(`SELECT * FROM tweet_user where id=${id}`);
            row = result.rows[0];
        } catch (e) {
            return [];
        }
        return row;
    }
    
}

module.exports = new UserRepository();