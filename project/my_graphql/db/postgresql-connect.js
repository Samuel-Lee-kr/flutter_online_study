const { Client } = require('pg');

class PostgresqlConnect {

    constructor() {
        this.Query = Client.Query;

        this.client = new Client({
            user: 'testuser',
            password: 'testuser',
            host: 'localhost',
            database: 'express',
            port: 5432
        });

        this.connect();
    }
    
    connect() {
        this.client.connect(err => {
            if (err) {
                console.log('connection error', err.stack);
            } else {
                console.log('success');
            }
        });
    }
    
}

module.exports = new PostgresqlConnect();