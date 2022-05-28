const { gql } = require("apollo-server");
const TweetService = require("../services/tweet-service");
const UserService = require("../services/user-service");

class MyGraphqlSchema {
    constructor() {
        this.typeDefs = this.initTypeDefs();
        this.resolvers = this.initResolvers();
    }

    initTypeDefs() {
        return gql`
            type Tweet {
                id: ID!
                text: String!
                author: User
            }
            
            """
            테스트용 멘션
            """
            type User {
                id: ID!
                username: String!
                firstname: String!
                lastname: String!
            }

            type Query {
                allTweets: [Tweet]!
                tweet(id: ID!): Tweet
                ping: String!
                allUsers: [User]!
            }

            type Mutation {
                postTweet(text: String!, userId: ID!): Tweet!
                deleteTweet(id: ID!): Boolean!
            }
        `;
    }

    initResolvers() {
        return {
            Query: {
                async allTweets() {
                    return await TweetService.findAll();
                },
                async tweet(root, { id }) {
                    return await TweetService.findById(id);
                },
                async allUsers() {
                    return await UserService.findAll();
                }
            },
            Mutation: {
                async postTweet(_, { text, userId }) {
                    return await TweetService.save(text, userId);
                },

                async deleteTweet(_, { id }) {
                    return await TweetService.deleteById(id);
                }
            },
            User: {
                username({username}) {
                    if(username) {
                        return 'test';
                    }
                    return 'hello';
                }
            },
            Tweet: {
                async author({user_id}) {
                    return await UserService.findById(user_id);
                }
            }
        };
    }
}

module.exports = new MyGraphqlSchema();