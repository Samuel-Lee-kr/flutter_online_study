package com.military.demo.configs;

import java.sql.Timestamp;

import org.jetbrains.annotations.NotNull;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import graphql.scalars.ExtendedScalars;
import graphql.schema.Coercing;
import graphql.schema.CoercingParseLiteralException;
import graphql.schema.CoercingParseValueException;
import graphql.schema.CoercingSerializeException;
import graphql.schema.GraphQLScalarType;

@Configuration
public class GraphqlScalarConfig {
    
    public static final GraphQLScalarType MyTimeStamp = GraphQLScalarType.newScalar()
        .name("Timestamp")
        .description("java.sql.Timestamp class")
        .coercing(new Coercing<Timestamp,Timestamp>() {

            @Override
            public Timestamp parseLiteral(@NotNull Object arg0) throws CoercingParseLiteralException {
                String input = String.valueOf(arg0);
                // input : StringValue{value='2022-05-26 11:09:27.6363947'}
                int equalIndex = input.indexOf("=");
                String parseInput = input.substring(equalIndex+1).replace("'", "").replace("}", "");
                // parseInput : 2022-05-26 11:09:27.6363947
                try {
                    return Timestamp.valueOf(parseInput);
                } catch (Exception e) {
                    e.printStackTrace();
                    throw new CoercingParseLiteralException(input + "parseLiteral is not type of Timestamp(pattern : yyyy-mm-dd hh:mm:ss[.fffffffff])");
                    // return null;
                }
            }

            @Override
            public Timestamp parseValue(@NotNull Object arg0) throws CoercingParseValueException {
                String input = String.valueOf(arg0);
                try {
                    return Timestamp.valueOf(input);
                } catch (Exception e) {
                    throw new CoercingParseValueException(input + " parseValue is not type of Timestamp");
                }
            }

            @Override
            public Timestamp serialize(@NotNull Object arg0) throws CoercingSerializeException {
                String input = String.valueOf(arg0);
                try {
                    return Timestamp.valueOf(input);
                } catch (Exception e) {
                    throw new CoercingSerializeException(input + "serialize is not type of Timestamp");
                }
            }

        })
        .build();
        
    @Bean
    public GraphQLScalarType date() {
        return ExtendedScalars.Date;
    }

    @Bean
    public GraphQLScalarType dateTime() {
        return ExtendedScalars.DateTime;
    }

    @Bean
    public GraphQLScalarType timestamp() {
        return MyTimeStamp;
    }
}
