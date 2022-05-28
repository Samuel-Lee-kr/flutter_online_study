const { ApolloServer } = require("apollo-server");
const MyGraphqlSchema = require("./graphql/my-graphql-schema");
const typeDefs = MyGraphqlSchema.typeDefs;
const resolvers = MyGraphqlSchema.resolvers;

const server = new ApolloServer({ typeDefs, resolvers });

server.listen().then(({ url }) => {
    console.log(`Running on ${url}`);
});