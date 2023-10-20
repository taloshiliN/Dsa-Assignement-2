import ballerina/graphql;
import ballerina/sql;
import ballerina/mysql;
import ballerina/mysql.driver as _;

//configuration of database
configurable string USER = "root";
configurable string PASSWORD = "Monkey2002";
configurable string HOST = "localhost";
configurable int PORT = 3306;
configurable string DATABASE = "Performance_System";

//establish connection
final mysql:Client dbClient =check new(
    host=HOST,user=USER,password=PASSWORD,port=PORT,database=DATABASE
);
public type HOD record{
    readonly string objectives;
};

public type Supervisor record{
    readonly string SuperVisorID;
    string Name;
    string Lastname;
};

public type Employee record{
    readonly string ID;
    string Name;
    string LastName;
    string KPI;
};

service /graphql on new graphql:Listener(9090) {
    //for the HOD
    resource function get EmployeeScores(string name) returns string{
        return "Hello, " + name;
    }
    remote function delete departmentObjective(string name) returns string{
        return "Hello, " + name;
    }
    remote function post departmentObejective(string name) returns string{

    }
    //for the supervisor
    remote function post EmployeeKPI(string name) returns string{

    }
    resource function get EmployeeTotalScores(string name) returns string{

    }
    remote function put EmployeeKPI(string name) returns string{

    }
    //for the employee
    remote function post KPI(string name) returns string{

    }
    remote function post GradeSupervisor(string name ) returns string{

    }
    resource function get Scores(string name) returns string {
        
    }
}
