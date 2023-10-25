import ballerina/io;
import ballerina/graphql;
import ballerina/sql;
import ballerinax/mysql.driver as _;
import ballerinax/mysql;

configurable string USER = ?;
configurable string PASSWORD = ?;
configurable string HOST = ?;
configurable int PORT = ?;
configurable string DATABASE = ?;

final mysql:Client dbClient = check new(
    host=HOST, user=USER, password=PASSWORD, port=PORT, database="Management"
);


type Department record {
    readonly int Department_ID;
    string Department_Name;
    string Department_HOD;
    string Department_Supervisor;
    string DEpartment_Employee;
};
type Employees record{
    readonly int Employee_ID;
    string Employee_Name;
    string Role;
    string Department_Name;
    string Grade;
};
type KPI record{
    readonly int KPI_ID;
    string KPI;
    string Department;

};
type Objective record{
    readonly string Objective_Name;
};

@graphql:ServiceConfig {
    graphiql: {
        enabled: true;
    }
};
service / on new graphql:Listener(9090) {

};