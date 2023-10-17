import ballerina/graphql;

service / on new graphql:Listener(9090) {
    resource function get greeting(string name) returns string|error {
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
