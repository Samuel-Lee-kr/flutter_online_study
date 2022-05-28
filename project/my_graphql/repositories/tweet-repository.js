const PostgresqlConnect = require("../db/postgresql-connect");

class TweetRepository {
    
    constructor() {
        this.client = PostgresqlConnect.client;
    }

    async findAll() {
        let rows;
        try {
            const result = await this.client.query('SELECT * FROM tweet');
            rows = result.rows;
        } catch (e) {
            return [];
        }
        return rows;
    }

    async findById(id) {
        let row;
        try {
            const result = await this.client.query(`SELECT * FROM tweet where id=${id}`);
            row = result.rows[0];
        } catch (e) {
            return [];
        }
        return row;
    }

    async count() {
        let row;
        try {
            const result = await this.client.query(`SELECT COUNT(*) FROM tweet`);
            row = result.rows[0];
        } catch (e) {
            return [];
        }
        return row;
    }

    async save(text, userId) {
        let row;
        try {
            const result = await this.client.query(`INSERT INTO tweet(text, user_id) VALUES('${text}', '${userId}') RETURNING id`);
            row = {
                id: result.rows[0]['id'],
                text: text,
                userId: userId
            }
        } catch (e) {
            return [];
        }
        return row;
    }

    async deleteById(id) {
        let row;
        try {
            const result = await this.client.query(`DELETE FROM tweet WHERE id = ${id} returning id`);
            if(result.rows.length != 0) {
                return true;
            } else {
                return false;
            }
        } catch(e) {
            console.log(e);
            row = false;
        }
        return row;
    }
}

module.exports = new TweetRepository();