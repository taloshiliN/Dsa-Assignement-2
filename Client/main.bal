import ballerina/io;
import ballerina/graphql;

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
public function main() returns error?{
    //connect
    string option;
    graphql:Client graphqlClient = check new ("localhost:9090/graphql");
    
    io:println("Welcome to the NUST PERFORMANCE EVALUATION SYSTEM");
    io:println("Please type according to your role respectfully");
    io:println("Head Of Department-----------------HOD:");
    io:println("Supervisor-------------------------SUP:");
    io:println("Employee---------------------------EMP:");
    string keyword=io:readln("Enter User: ");
    if (keyword=="HOD"){
        io:println("What do you want to do              :");
        io:println("Create department objectives        :ADD");
        io:println("View Employees Total Scores         :GET");
        io:println("Delete department objectives        :REMOVE");
        io:println("Assign the Employee to a supervisor :ASSIGN");
        string choice1=io:readln("Enter here: ");
        if (choice1==="ADD"){
        check ();
        } else if (choice1=="GET"){
            // check EmployeeScore(graphqlClient);
        } else if (choice1=="REMOVE"){
            check ();
        } else if (choice1=="ASSIGN"){
            check ();
        } else {
            io:println("That is not a keyword");
        }
    }    
    else 
    if (keyword=="SUP"){
        io:println("Approve Employee KEY PERFORMANCE INDICATORS---:APPROVE");
        io:println("Delete  Employee KEY PERFORMANCE INDICATORS---:REMOVE" );
        io:println("View    Employee KEY PERFORMANCE INDICATORS---:GET"    );
        io:println("Update  Employee KEY PERFORMANCE INDICATORS---:UPDATE" );
        io:println("Grade   Employee KEY PERFORMANCE INDICATORS---:GRADE"  );
        string choice2=io:readln("Enter here: ");
        if (choice2==="APPROVE"){
        check ();
        } else if (choice2=="REMOVE"){
            check ();
        } else if (choice2=="GET"){
            check ();
        } else if (choice2=="UPDATE"){
            check ();
        } else if (choice2=="GRADE"){
            check ();
        } else
            {
            io:println("That is not a keyword");
        }
    }
    else
    if (keyword=="EMP"){
        io:println("Create Your KEY PERFORMANCE INDICATORS---:ADD"  );
        io:println("Grade  Your Supervisor-------------------:GRADE");
        io:println("View   Your Scores-----------------------:GET"  );
        string choice3=io:readln("Enter Here: ");
        if (choice3==="Add"){
            check ();
        } else if(choice3=="Grade"){
            check ();
        } else if(choice3=="Get"){
            check ();
        } 
        else {
        io:println("Such a command does not exist");
        }
    }
    else {
    io:println("Not a keyword");
    }
}
//HOD
//GET EMPLOYEE SCORE
// public function EmployeeScore(graphql:Client Employee) returns string|error?{
//     if (Employee is graphql:Client){
//          Employee result=check graphql->/EmployeeScores;
//          foreach Employee item in result{
//              io:println("Staff No:",Employee.EmployeeID,", Staff Name:",Employee.EmployeeName,", Office No:",Employee.EmployeeSurname,", CourseName:",Employee.CoursesName);
//          }
// //     }
// }
//     string back=io:readln("To go back just type back: ");
//     if(back=="back"){
//     error? MainMenu=main();
//          if MainMenu is error{
//              io:println("Yeah... Thats not a command");
//         }
//     }
// }
// remote function getStaffByStaffNo(graphql:Client http, string StaffNo)returns error?{
//     if(http is http:Client){
//          Lecturer lecturer=check http->/GetStaffByStaffNo(Staff_No=StaffNo);
//          io:println("Staff No: ",lecturer.Staff_No," Staff Name: ",lecturer.Staff_Name," Office No: ",lecturer.Office_No," Course Name: ",lecturer.CoursesName);
//     }
// }
// remote function getByCourseName(graphql:Client http,string CourseName) returns error?{
//     if (http is http:Client){
//          Lecturer lecturer=check http->/GetByCourseName(Course_Name=CourseName);
//          io:println("Staff No: ",lecturer.Staff_No," Staff Name: ",lecturer.Staff_Name," Office No: ",lecturer.Office_No," Course Name: ",lecturer.CoursesName);
//     }
// }
// public function getByOfficeNo(graphql:Client http, string OfficeNo) returns error?{
//     if(http is http:Client){
//         Lecturer lecturer=check http->/GetByOfficeNo(Office_Num=OfficeNo);
//         io:println("Staff No: ",lecturer.Staff_No," Staff Name: ",lecturer.Staff_Name," Office No: ",lecturer.Office_No," Course Name: ",lecturer.CoursesName);
//     }
// }
//To add a lecturer
//remote function CreateStaff(graphql:Client http, Lecturer lecturer) returns error?{
    // if(http is http:Client){
    //     string message=check http->/addstaffRecord.post(lecturer);
    //     io:print(message);
    // }
//}
// remote function AddStaff()returns string{
//     string lecturerName=io:readln("Enter a Lecturer Name: ");
//     return lecturerName;
// }