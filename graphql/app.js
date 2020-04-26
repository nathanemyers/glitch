import { ApolloServer } from 'apollo-server'
import typeDefs from './schema'
import resolvers from './resolvers'

const server = new ApolloServer({
  typeDefs,
  resolvers,
  //dataSources,
  context: () => ({
  }),
})

server
  .listen({ port: 4000 })
  .then(({ url }) => console.log(`🚀 app running at ${url}`))
