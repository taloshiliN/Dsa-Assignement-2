import ballerina/io;
import ballerina/graphql;

public function main() returns error?{
    //connect
    string option;
    graphql:Client graphqlClient = check new ("localhost:9090/graphql");

    io:println("Welcome to the NUST PERFORMANCE EVALUATION SYSTEM");
    io:println("Please type according to your role respectfully");
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

    
    if (keyword=="Head Of Department"){
        option=io:readln("Sign Up or Login: ");
        if option=="Sign up"{
            //Head of department sign up
            //check AddUser();
            io:println("What do you want to do:");
            io:println("Create department objectives       :Add");
            io:println("View Employees Total Scores    :Get");
            io:println("Delete department objectives  :Remove");
            io:println("Assign the Employee to a supervisor  :Assign");
            string choice1=io:readln("Enter here: ");
            if (choice1==="Add"){
                check ();
            } else if (choice1=="Get"){
                check ();
             } else if (choice1=="Remove"){
                check ();
                } else if (choice1=="Assign"){
                check ();
            } else {
                io:println("That is not a keyword");
            }  
            } 
    }
        else if option=="Login"{
            //Head of department Login
            //check AddUser();
            
            io:println("What do you want to do:");
            io:println("Create department objectives       :Add");
            io:println("View Employees Total Scores    :Get");
            io:println("Delete department objectives  :Remove");
            io:println("Assign the Employee to a supervisor  :Assign");
            string choice1=io:readln("Enter here: ");
            if (choice1==="Add"){
                check ();
            } else if (choice1=="Get"){
                check ();
             } else if (choice1=="Remove"){
                check ();
                } else if (choice1=="Assign"){
                check ();
            } else {
                io:println("That is not a keyword");
            }  

        } 
    else if ( keyword=="Supervisor"){
        option=io:readln("Sign Up or log in: ");
         if option=="Sign up"{
            //Supervisor sign up
            //check AddUser();
            io:println("What do you want to do:");
            io:println("Approve Employee's KPIs     :Approve");
            io:println("Delete Employee KPIs     :Remove");
            io:println("Update Employee's KPIs :Update");
            io:println("View Individually Assigned Employee Scores :Get");
            io:println("Grade the employee KPIs :Grade");

            string choice2=io:readln("Enter Here: ");
            if (choice2==="Approve"){
                check ();
            } else if(choice2=="Remove"){
                check ();
            } else if(choice2=="Update"){
                check ();
            } else if(choice2=="Get"){
                check ();
            } else if(choice2=="Grade"){
                check ();
            } else{
                io:println("That is not a keyword");
            }            
        } else {
            io:println("Such a command does not exist");
        }          
    }
           else if option=="Login"{
            //Supervisor Login
            //check AddUser();
            io:println("What do you want to do:");
            io:println("Approve Employee's KPIs     :Approve");
            io:println("Delete Employee KPIs     :Remove");
            io:println("Update Employee's KPIs :Update");
            io:println("View Individually Assigned Employee Scores :Get");
            io:println("Grade the employee KPIs :Grade");

            string choice2=io:readln("Enter Here: ");
            if (choice2==="Approve"){
                check ();
            } else if(choice2=="Remove"){
                check ();
            } else if(choice2=="Update"){
                check ();
            } else if(choice2=="Get"){
                check ();
            } else if(choice2=="Grade"){
                check ();
            } else{
                io:println("That is not a keyword");
            }            
        } 
        else {
            io:println("Such a command does not exist");
        }
                  
    else if (keyword=="Employee"){
        option=io:readln("Sign Up or log in: ");
        if option=="Sign up"{
            //Employee sign up
            //check AddUser();
            io:println("What do you want to do:");
            io:println("Create Your KPIs    :Add");
            io:println("Grade Your Supervisor     :Grade");
            io:println("View Your Scores :Get");
           
            string choice2=io:readln("Enter Here: ");
            if (choice2==="Add"){
                check ();
            } else if(choice2=="Grade"){
                check ();
            } else if(choice2=="Get"){
                check ();
            }      
        } else {
            io:println("Such a command does not exist");
            }   
              }  
                 else if option=="Login"{
            //Employee Login
            //check AddUser();
            io:println("What do you want to do:");
            io:println("Create Your KPIs    :Add");
            io:println("Grade Your Supervisor     :Grade");
            io:println("View Your Scores :Get");
           
            string choice2=io:readln("Enter Here: ");
            if (choice2==="Add"){
                check ();
            } else if(choice2=="Grade"){
                check ();
            } else if(choice2=="Get"){
                check ();
            }      
        } else {
            io:println("Such a command does not exist");
    }        
}