
*Khan Hassan - EPI 5143: Quiz 1 

Created: Feb 09, 2023;

*Q2- create SAS lib 'quiz 1';
libname QUIZ1 '/home/u63048332/';

*Q3- Added file 'quiz1_data.sas7bdat' to lib Quiz1 and then pulled the file using the following code;
proc contents data= '/home/u63048332/quiz1/quiz1_data.sas7bdat';
run; 
*Q3- Ans: The output generated shows that there are 1150 obs and 7 variables

-----------

*Q4- Use PROC FREQ to provide information about the variable diabetes.  
If this variable represents those individuals in the dataset with diabetes, what proportion of people in the dataset have diabetes? (provide the frequency table with your answers);
proc freq data= '/home/u63048332/quiz1/quiz1_data.sas7bdat';
table diabetes;
run; 
*Q4- Ans: 31 out of 1150 people have diabetes. Hence, the proportion of people who have diabetes is 2.70%

-----------

*Q5a- Use PROC UNIVARIATE to provide information about the variable X1. What are the mean and standard deviation of X1?;
proc univariate data='/home/u63048332/quiz1/quiz1_data.sas7bdat';
var X1; 
histogram X1;
run;
*Q5a- Ans: For variable X1, mean= 1.17, std=0.98
*Q5b- Line 28 computes frequency histogram for var X1

-----------

*Q6- Create a temporary copy of the quiz1 dataset called work.quiz1;
data work.quiz1;
  set '/home/u63048332/quiz1/quiz1_data.sas7bdat'; *Q6-Ans: Asking SAS to pull this file from lib to create a new temporary dataset called 'work.quiz1';
run;

*-----------

*Q7a- Create a new variable called mean_V1 that is the mean of X1, X2 and X3 using mathematical operators;
data work.quiz1;
  set work.quiz1;
  mean_V1 = (X1 + X2 + X3) / 3; *Q7a- Ans: created a new variable 'V1' that takes the average of X1,X2 and X3 using mathematical operators;
run;

*-----------

Q7b- Create a new variable called mean_V2 that is the mean of X1, X2 and X3 using a SAS function;
data work.quiz1;
  set work.quiz1;
  mean_V2 = mean(X1, X2, X3); *Q7b- Ans: created a new variable 'V1' that takes the average of X1,X2 and X3 using SAS fucntion; 
run;

*-----------

Q8- Consult_dt and Surgery_dt are SAS dates.  Create a new variable called wait_time that calculates the time in days between consult and surgery;
data work.quiz1;
  set work.quiz1;
  wait_time = intck('day', Consult_dt, Surgery_dt); *Q8 - Ans: created a new variable which is the time difference (in days) between consult date (i.e., start date) and surgery date (i.e., end date);
run;

*-----------

*Q9- Create a new variable called X2_high which has a value of 1 if X2 is greater than or equal to the mean of X2 and 0 otherwise

Step 1 - Finding out the mean of X2;
proc univariate data=work.quiz1;
var X2; *...which is 11.05;
run; 

*Q9 - Step 2; 
data work.quiz1;
  set work.quiz1;
  if X2 >= 11.05 then X2_high = 1;
  else X2_high = 0;
run;


*-----------

Q10a - Use PROC UNIVARIATE to find out the mean values of the variables of mean_V1, and mean_V2, and the median, minimum and maximum values for wait_time;
proc univariate data=work.quiz1;
  var mean_V1 mean_V2 wait_time;
run;

*Q10a - Ans: The mean of variables 'meanv1' and 'meanV2' is 12.74. 
The median for 'wait_time' is 52.00 and the min/max values are 0 and 99, respectively;

*-----------

Q10b- Use PROC FREQ to create a 2x2 frequency table for X1_high vs. diabetes.;
proc freq data=work.quiz1;
table X2_high * diabetes;
run;


**-----------END QUIZ 1 -----------**

