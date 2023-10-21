import ballerina/graphql;
//import ballerina/sql;
//import ballerina/mysql;
//import ballerina/mysql.driver as _;

//configuration of database
//configurable string USER = "root";
//configurable string PASSWORD = "Monkey2002";
//configurable string HOST = "localhost";
//configurable int PORT = 3306;
//configurable string DATABASE = "Performance_System";

//establish connection
//final mysql:Client dbClient =check new(
//    host=HOST,user=USER,password=PASSWORD,port=PORT,database=DATABASE
//);
public type HOD record{
    readonly string ID;
};
public type Supervisor record{
    readonly string ID;
    boolean EmployeeKPI;
    int gradeEmployee;
};
public type Employee record{
    readonly string ID;
};

public type Objectives record{
    string description;
};

table<HOD> key(ID) HodTable=table[];
table<Supervisor> key(ID) SupervisorTable=table[];
table<Employee> key(ID) EmployeeTable=table[];
table<Objectives>key() ObjectiveTable=table[];

@graphql:ServiceConfig{
    graphiql: {
        enables: true
    }
}

service /graphql on new graphql:Listener(9090) {
    //for the HOD
    resource function get EmployeeScores() returns table<Employee>{
        return EmployeeTable;
    }
    resource function delete departmentObjective(string name) returns string{
        return "Hello, " + name;
    }
    remote function CreateDepartmentObjective(Objectives newObjective) returns string{
        var {code, ...data} = newObjective;
        ObjectiveTable.add({code: code, ...data});
        ObjectiveTable.add({code: description:newObjective.description});
        return newObjective.name + "Objective created";
    }
    //for the supervisor
    remote function UpdateEmployeeKPI(string name) returns Supervisor{
        var {code, ...data} = newObjective;
        ObjectiveTable.add({code: code, ...data});
        ObjectiveTable.add({code: description:newObjective.description});
        return newObjective.name + "";
    }
    resource function get EmployeeTotalScores(string name) returns string{
        return "Hello, " + name;
    }
    remote function UpdateEmployeeKPI(string name) returns {
        return "Hello, " + name;
    }
    //for the employee
    resource function post KPI(string name) returns string{
        return "Hello, " + name;
    }
    resource function post GradeSupervisor(string name ) returns string{
        return "Hello, " + name;
    }
    resource function get Scores(string name) returns string {
        return "Hello, " + name;
    }
}
