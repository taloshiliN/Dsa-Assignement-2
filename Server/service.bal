import ballerina/graphql;
import ballerina/sql;
import ballerinax/mysql.driver as _;
import ballerinax/mysql;
import ballerina/io;


//configuration of database
//configurable string USER = "root";
//configurable string PASSWORD = "Monkey2002";
//configurable string HOST = "localhost";
//configurable int PORT = 3307;
//configurable string DATABASE = "fci_system";

//establish connection
//final mysql:Client dbClient =check new(
//    host=HOST, user=USER, password=PASSWORD, port=PORT, database="fci_system"
//);

type HOD record{
    readonly int HODid;
    string Name;
    string Surname;
};
type Supervisor record{
    readonly int SuperVisorID;
    string SuperVisorName;
    int gradeSupervisor;
    string assignedEmployee;
};

type Employee record{
    readonly int EmployeeID;
    string EmployeeName;
    string EmployeeSurname;
    string GradeEmployee;
    string assignedSup;
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
@graphql:ServiceConfig{
    graphiql: {
        enabled: true
    }
}

service /graphql on new graphql:Listener(9090) {
    private final mysql:Client dbClient;
    function init() returns error?{
        self.dbClient = check new ("localhost", "root", "Monkey2002", "fci_system", 3307);
    }
    private Employee profile;
    //FUNCTIONS OF HEAD OF DEPARTMENT
    
    //CREATE
    remote function CreateDepartmentObjective(Objectives newObjective) returns string|error{
        sql:ExecutionResult result = check self.dbClient->execute(`INSERT INTO head_of_departmemt_Table VALUES (${newObjective.ObjectiveDescription})`);
        if result.affectedRowCount>0{
            return ("Objective successfully uploaded");
        } else {
            return error("Failed to upload the objective");
        }
    }

    remote function AssignEmployee(Employee EmployeeID) returns string|error{
        sql:ExecutionResult result= check self.dbClient->execute(`INSERT INTO supervisor_Table SELECT (${EmployeeID.EmployeeID}) FROM employee_Table`);
        if result.affectedRowCount>0{
            return ("Employee successfully assigned to Supervisor");
        } else {
            return error("Employee failed to be assigned");
        }
    }
    //READ
    resource function get EmployeeScores(Employee EmployeeScores) returns string|error{
        sql:ExecutionResult result= check self.dbClient->execute(`SELECT * FROM employee_Table WHERE (${EmployeeScores.EmployeeID},${EmployeeScores.GradeEmployee})`);
        if result.affectedRowCount>0{
            return string `${EmployeeScores.EmployeeID}, ${EmployeeScores.GradeEmployee} retrieved successfully`;
        } else {
            return error("Failed to retrieve ID and Grade");
        }
    }
    //DELETE
    remote function DeleteDepartmentObjective(Objectives DeleteObjectives) returns string|error{
        sql:ExecutionResult result = check self.dbClient->execute(`DELETE FROM head_of_departmemt_Table VALUES (${DeleteObjectives.ObjectiveID})`);
        if result.affectedRowCount>0{
            return ("Objective successfully Deleted");
        } else {
            return error("Failed to Delete the objective");
        }
    }
    //for the supervisor
    remote function UpdateEmployeeKPI(kpi UpdateKPI) returns string|error{
        sql:ParameterizedQuery KPIQuery=``;
        sql:ParameterizedQuery KPIDESCRIPTIONQuery=``;
        sql:ParameterizedQuery KPIVALIDQuery=``;
        sql:ExecutionResult KPI_Result;
        sql:ExecutionResult KPIDESCRIPTION_Result;
        sql:ExecutionResult KPIVALID_Result;
        int checkvalue = 0;
        if (UpdateKPI.kpiID != check int:fromString(io:readln())){
            KPIQuery = `UPDATE kpi_table
            SET
            KPI = ${UpdateKPI.kpiID}
            WHERE
            kpi =${UpdateKPI.kpiID};`;
            KPI_Result = check self.dbClient->execute(KPIQuery);
            if (KPI_Result.affectedRowCount>0){

            } else {
                checkvalue=1;
            }
        }

        if(UpdateKPI.kpiDescription !=""){
            KPIDESCRIPTIONQuery = `UPDATE kpi_table
            SET
            kpi_description = ${UpdateKPI.kpiDescription}
            WHERE
            kpi = ${UpdateKPI.kpiID};`;
            KPIDESCRIPTION_Result = check self.dbClient->execute(KPIDESCRIPTIONQuery);
            if (KPIDESCRIPTION_Result.affectedRowCount>0){

            } else {
                checkvalue=1;
            }
        }

        if(UpdateKPI.isvalid != true){
            KPIVALIDQuery = `UPDATE kpi_table
            SET
            kpi_valid= ${UpdateKPI.isvalid}
            WHERE
            kpi = ${UpdateKPI.kpiID};`;
            KPIVALID_Result = check self.dbClient->execute(KPIVALIDQuery);
            if (KPIVALID_Result.affectedRowCount>0){

            } else {
                checkvalue=1;
            }
        }
        
        if (checkvalue<1){
            return ("Succesfuly Updated book");
        } else {
            return error("Failed to Updated book ");
    }
}
    resource function get EmployeeID(Supervisor EmployeeID) returns string|error{
        sql:ExecutionResult result= check self.dbClient->execute(`SELECT * FROM employee_Table WHERE (${EmployeeID.assignedEmployee})`);
        if result.affectedRowCount>0{
            return string `${EmployeeID.assignedEmployee} retrieved successfully`;
        } else {
            return error("Failed to retrieve ID and Grade");
        }
    }
    remote function DeleteEmployeeKPI(kpi DeleteKPI) returns string|error{
        sql:ExecutionResult result=check self.dbClient->execute(`DELETE FROM kpi_table VALUES (${DeleteKPI.kpiID})`);
        if result.affectedRowCount>0{
            return ("KPI successfully Deleted");
        } else {
            return error("Failed to Delete the KPI");
        }
    }
    //for the employee
    remote function CreateEmployeeKPI(kpi newKPI) returns string|error{
        sql:ExecutionResult result = check self.dbClient->execute(`INSERT INTO kpi_table VALUES (${newKPI.kpiDescription})`);
        if result.affectedRowCount>0{
            return ("KPI successfully uploaded");
        } else {
            return error("Failed to upload the KPI");
        }
    }
    remote function GradeSupervisor(Supervisor newGrade) returns string|error{
        sql:ExecutionResult result = check self.dbClient->execute(`INSERT INTO Supervisor_table VALUES (${newGrade.gradeSupervisor})`);
        if result.affectedRowCount>0{
            return ("Supervisor Grade submitted");
        } else {
            return error("Failed to submit supervisor grade");
        }
    }
    resource function get Scores(Employee score) returns string|error{
        sql:ExecutionResult result = check self.dbClient->execute(`SELECT * FROM Employee WHERE (${score.EmployeeID})`);
        if result.affectedRowCount>0{
            return ("Scores retrieved Successfully");
        } else {
            return error("Scores Failed to be Retrieved");
        }
    }
}
