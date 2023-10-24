import ballerina/graphql;
import ballerina/sql;
import ballerinax/mysql.driver as _;
import ballerinax/mysql;


//configuration of database
configurable string USER = "root";
configurable string PASSWORD = "";
configurable string HOST = "localhost";
configurable int PORT = 3306;
configurable string DATABASE = "fci_system";

//establish connection
final mysql:Client dbClient =check new(
    host=HOST, user=USER, password=PASSWORD, port=PORT, database="fci_system"
);

type HOD record{
    readonly int HODid;
    string Name;
    string Surname;
};
type Supervisor record{
    readonly int SuperVisorID;
    string SuperVisorName;
    int gradeSupervisor;
};

type Employee record{
    readonly int EmployeeID;
    string EmployeeName;
    string EmployeeSurname;
};

type kpi record{
    readonly int kpiID;
    string kpiDescription;
    string objectiveid;
    boolean isvalid;
};

type Objectives record{
    readonly int ObjectiveID;
    string ObjectiveDescription;
};

//type KPI record{
//readonly 
//}

@graphql:ServiceConfig{
    graphiql: {
        enabled: true
    }
}

service /graphql on new graphql:Listener(9090) {
    private Employee profile;
    //for the HOD
    
    //CREATE
    remote function CreateDepartmentObjective(Objectives newObjective) returns string|error{
        sql:ExecutionResult result = check dbClient->execute(`INSERT INTO head_of_departmemt VALUES (${newObjective.ObjectiveDescription})`);
        if result.affectedRowCount>0{
            return ("Objective successfully uploaded");
        } else {
            return error("Failed to upload the objective");
        }
    }
    //READ
    resource function get EmployeeScores(Supervisor AllEmployee) returns int|error{
        return SuperVisorID;
    }
    //DELETE
    remote function DeleteDepartmentObjective(HOD DeleteObjectives) returns string|error{
        sql:ExecutionResult result = check dbClient->execute(`DELETE FROM Head_Of_Departmemt VALUES (${DeleteObjectives.ObjectiveID})`);
        if result.affectedRowCount>0{
            return ("Objective successfully Deleted");
        } else {
            return error("Failed to Delete the objective");
        }
    }
    //for the supervisor
    remote function UpdateEmployeeKPI(Employee Updatekpi) returns string|error{
        sql:ParameterizedQuery KPIQuery=``;
        sql:ExecutionResult KPI_Result;
        int checkvalue = 0;
        if (Updatekpi.kpi !=""){
            KPIQuery = `UPDATE employee
            SET
            KPI = ${Updatekpi.kpi}
            WHERE
            EmployeeID=${Updatekpi.EmployeeID};`;
            KPI_Result = check dbClient->execute(KPIQuery);
            if (KPI_Result.affectedRowCount>0){

            } else {
                checkvalue=1;
            }
        }
    }
    resource function get EmployeeID(Employee ID) returns string|error{
        return EmployeeID;
    }
    remote function UpdateEmployeeKPI(string name) returns string|error{
        sql:ParameterizedQuery KPIQuery=``;
        sql:ExecutionResult KPI_Result;
        int checkvalue = 0;
        if (Updatekpi.kpi !=""){
            KPIQuery = `UPDATE employee
            SET
            KPI = ${Updatekpi.kpi}
            WHERE
            EmployeeID=${Updatekpi.EmployeeID};`;
            KPI_Result = check dbClient->execute(KPIQuery);
            if (KPI_Result.affectedRowCount>0){

            } else {
                checkvalue=1;
            }
        }
    }
    //for the employee
    remote function CreateEmployeeKPI(Employee newKPI) returns string|error{
        sql:ExecutionResult result = check dbClient->execute(`INSERT INTO Employee VALUES (${newKPI.kpi})`);
        if result.affectedRowCount>0{
            return ("KPI successfully uploaded");
        } else {
            return error("Failed to upload the KPI");
        }
    }
    remote function GradeSupervisor(Employee newGrade) returns string|error{
        sql:ExecutionResult result = check dbClient->execute(`INSERT INTO Employee VALUES (${newGrade.gradeSupervisor})`);
        if result.affectedRowCount>0{
            return ("Supervisor Grade submitted");
        } else {
            return error("Failed to submit supervisor grade");
        }
    }
    resource function get Scores(Supervisor score) returns string|error{
        sql:ExecutionResult result = check dbClient->execute(`SELECT * FROM Employee WHERE (${score.GradeEmployee})`);
        if result.affectedRowCount>0{
            return ("Scores retrieved Successfully");
        } else {
            return error("Scores Failed to be Retrieved");
        }
    }
}
