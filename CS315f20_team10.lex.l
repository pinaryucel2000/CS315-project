MAIN		             "main"
RETURN                       "return"
DEF                          "DEF"
CALL		             "CALL"
WHILE		             "while"
FOR		             "for"
DO		             "do"
IF		             "if"
ELSE		             "else"
CONST			     "const"
READ_INCLINATION   	     "readInclination"
READ_ALTITUDE 		     "readAltitude"
READ_TEMP		     "readTemperature"
READ_ACCELERATION 	     "readAcceleration"
VIDEO_CAM_ON		     "videoCameraOn"
TAKE_PIC		     "takePicture"
READ_TIME_STAMP		     "readTimeStamp"
CONNECT_TO_BASE_COMPUTER     "connectToBaseComputer"
LB		             "{"
RB		             "}"
LP		             "("
RP		             ")"
ASSIGN_OP	             "="
ADDITION_OP	             "+"
SUBTRACTION_OP               "-"
MULTIPLICATION_OP            "*"
DIVISION_OP	             "/"
EQUAL_OP	             "=="
NOT_EQUAL_OP	             "!="
GREATER_OP	             ">"
LESS_OP		             "<"
AND_OP		             "&&"
OR_OP		             "||"
NOT_OP		             "!"
END_STMT	             ";"
COMMA		             ","
COMMENT  	             "//"[a-zA-Z0-9 .]*
INPUT_FILE 		     ">>F"
INPUT_KEYBOARD 		     ">>K"
OUTPUT_FILE 		     "<<F"
OUTPUT_CONSOLE		     "<<C"
DOUBLE			     ([0-9]*"."[0-9]*|"-"[0-9]*"."[0-9]*)
TEMPERATURE	             ([0-9]*"."[0-9]*" C"|"-"[0-9]*"."[0-9]*" C")
INTEGER		             ([1-9][0-9]*|"-"[1-9][0-9]*|"0")
TYPE		             "int"|"string"|"bool"|"double"|"temp"
BOOLEAN		             "true"|"false"
FILE_NAME	             [a-z_][a-zA-Z0-9_]*".txt"
IDENTIFIER	             [a-z_][a-zA-Z0-9_]*
STRING		             "\""[a-zA-Z0-9_ :\\n]*"\""

%option yylineno
%%
{MAIN}	   	             return MAIN;
{RETURN}	             return RETURN;
{DEF}	   	             return DEF;
{CALL}	  	             return CALL;
{WHILE}	    	             return WHILE;
{FOR}		             return FOR;
{DO}		             return DO;
{IF}		             return IF;
{ELSE}		             return ELSE;
{CONST}			     return CONST;
{READ_INCLINATION}   	     return READ_INCLINATION;
{READ_ALTITUDE}              return READ_ALTITUDE;
{READ_TEMP}		     return READ_TEMP;
{READ_ACCELERATION} 	     return READ_ACCELERATION;
{VIDEO_CAM_ON}		     return VIDEO_CAM_ON;
{TAKE_PIC}		     return TAKE_PIC;
{READ_TIME_STAMP}	     return READ_TIME_STAMP;
{CONNECT_TO_BASE_COMPUTER}   return CONNECT_TO_BASE_COMPUTER;
{LB}		             return LB;
{RB}		             return RB;
{LP}		             return LP;
{RP}		             return RP;
{ASSIGN_OP}	             return ASSIGN_OP;
{ADDITION_OP}	             return ADDITION_OP;
{SUBTRACTION_OP}             return SUBTRACTION_OP;
{MULTIPLICATION_OP}          return MULTIPLICATION_OP;
{DIVISION_OP}	             return DIVISION_OP;
{EQUAL_OP}	             return EQUAL_OP;
{NOT_EQUAL_OP}               return NOT_EQUAL_OP;
{GREATER_OP}	             return GREATER_OP;
{LESS_OP}	             return LESS_OP;   
{AND_OP}	             return AND_OP;
{OR_OP}		             return OR_OP;
{NOT_OP}	             return NOT_OP;
{END_STMT}	             return END_STMT;
{COMMA}	   	             return COMMA;
{COMMENT}                    ;
{INPUT_FILE} 		     return INPUT_FILE;
{INPUT_KEYBOARD}             return INPUT_KEYBOARD;
{OUTPUT_FILE} 		     return OUTPUT_FILE;
{OUTPUT_CONSOLE}             return OUTPUT_CONSOLE;
{DOUBLE}	             return DOUBLE;
{TEMPERATURE}	             return TEMPERATURE;
{INTEGER}	             return INTEGER;
{TYPE}	    	             return TYPE;
{BOOLEAN}	             return BOOLEAN;
{FILE_NAME}	             return FILE_NAME;
{IDENTIFIER}	             return IDENTIFIER;
{STRING}	             return STRING;
[\n\t ]			     ;


%%
int yywrap() { return 1; }

