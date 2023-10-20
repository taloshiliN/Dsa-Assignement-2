import ballerina/io;
import ballerina/graphql;

public function main() returns error?{
    //connect
    graphql:Client graphqlClient = check new ("localhost:9090/graphql");

    io:println("Welcome to the NUST PERFORMANCE EVALUATION SYSTEM");
    io:println("Please type the according to your role respectfully");
    io:println("Head Of Department             :");
    io:println("Supervisor          :");
    io:println("Employee            :");
    string keyword=io:readln("Enter User: ");

    if (keyword=="Head Of Department"){

    } else if (keyword=="Supervisor"){

    } else if (keyword=="Employee"){

    } else{
        io:println("Not a keyword");
    }
}
