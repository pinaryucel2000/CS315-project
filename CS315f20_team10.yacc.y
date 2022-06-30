%token MAIN		         
%token RETURN                      
%token DEF                         
%token CALL		             
%token WHILE		            
%token FOR		           
%token DO		            
%token IF		             
%token ELSE	
%token CONST	             
%token READ_INCLINATION   	  
%token READ_ALTITUDE 		     
%token READ_TEMP		     
%token READ_ACCELERATION 	     
%token VIDEO_CAM_ON		     
%token TAKE_PIC		     
%token READ_TIME_STAMP		     
%token CONNECT_TO_BASE_COMPUTER   
%token LB		            
%token RB		            
%token LP		           
%token RP		             
%token ASSIGN_OP	            
%token ADDITION_OP	           
%token SUBTRACTION_OP               
%token MULTIPLICATION_OP            
%token DIVISION_OP	            
%token EQUAL_OP	            
%token NOT_EQUAL_OP	            
%token GREATER_OP	            
%token LESS_OP		             
%token AND_OP		            
%token OR_OP		           
%token NOT_OP		           
%token END_STMT	             
%token COMMA		            
%token COMMENT  	             
%token INPUT_FILE 		     
%token INPUT_KEYBOARD 		     
%token OUTPUT_FILE 		     
%token OUTPUT_CONSOLE	            
%token DOUBLE			    
%token TEMPERATURE	            
%token INTEGER		             
%token TYPE		             
%token BOOLEAN
%token FILE_NAME		             
%token IDENTIFIER	             
%token STRING         

%start program

%%

program		            : functionDefs main 
			    | main
			    ;
 			      
functionDefs		    : functionDef 
			    | functionDef functionDefs
			    ;

main			    : MAIN LP RP LB statements RB 
			    | MAIN LP RP LB RB
		            ;

statement  		    : returnStatement 
			    | variableDec
  			    | assign END_STMT 
 			    | loop
			    | conditionalStatement
			    | input END_STMT 
			    | output END_STMT 
			    | functionCall END_STMT
			    ;

statements		    : statement
			    | statement statements
			    ;

literal 		    : INTEGER 
			    | STRING
			    | BOOLEAN
			    | DOUBLE
			    | TEMPERATURE
			    ;

returnStatement		    : RETURN expression END_STMT
			    ;

variableDec		    : TYPE IDENTIFIER END_STMT
			    | CONST TYPE IDENTIFIER ASSIGN_OP expression END_STMT 
			    ;

assign			    : IDENTIFIER ASSIGN_OP expression
			    ;

expression		    : expression OR_OP andExp 
			    | andExp
			    ;

andExp			    : andExp AND_OP equalsExp 
			    | equalsExp
			    ;

equalsExp 		    : equalsExp EQUAL_OP greaterThanExp 
			    | equalsExp NOT_EQUAL_OP greaterThanExp 
			    | greaterThanExp
			    ;

greaterThanExp		    : greaterThanExp GREATER_OP lessThanExp 
			    | lessThanExp
			    ;

lessThanExp 		    : lessThanExp LESS_OP additionSubtractionExp
			    | additionSubtractionExp
			    ;

additionSubtractionExp	    : additionSubtractionExp ADDITION_OP multiplicationDivisionExp
			    | additionSubtractionExp SUBTRACTION_OP multiplicationDivisionExp 
			    | multiplicationDivisionExp
			    ;

multiplicationDivisionExp   : multiplicationDivisionExp MULTIPLICATION_OP parenthesisExp
			    | multiplicationDivisionExp DIVISION_OP parenthesisExp 
			    | parenthesisExp
			    ;

parenthesisExp 		    : LP expression RP 
			    | notExpression
			    ;

notExpression		    : NOT_OP IDENTIFIER 
			    | literal
			    | IDENTIFIER 
			    | functionCall
			    ;		

loop			    : whileLoop
 			    | forLoop
			    | doWhileLoop
			    ;

whileLoop		    : WHILE LP expression RP LB statements RB
			    ;

forLoop			    : FOR LP assign COMMA expression COMMA assign RP LB statements RB
			    ;

doWhileLoop		    : DO LB statements RB WHILE LP expression RP END_STMT
			    ;

conditionalStatement        : ifStatement 
			    | ifElseStatement
			    ;

ifStatement 		    : IF LP expression RP LB statements RB
			    ;

ifElseStatement		    : IF LP expression RP LB statements RB ELSE LB statements RB
			    ;

input 			    : INPUT_FILE FILE_NAME IDENTIFIER
			    | INPUT_KEYBOARD IDENTIFIER
			    ;

output			    : OUTPUT_FILE FILE_NAME IDENTIFIER 
			    | OUTPUT_FILE FILE_NAME literal
		    	    | OUTPUT_FILE FILE_NAME functionCall
			    | OUTPUT_CONSOLE IDENTIFIER 
			    | OUTPUT_CONSOLE literal
			    | OUTPUT_CONSOLE functionCall
			    ;

functionDef		    : DEF TYPE IDENTIFIER LP argsDef RP LB statements RB 
			    | DEF TYPE IDENTIFIER LP RP LB statements RB 
			    | DEF IDENTIFIER LP argsDef RP LB statements RB 
			    | DEF IDENTIFIER LP RP LB statements RB
			    ;

functionCall		    : CALL IDENTIFIER LP argsCall RP 
			    | CALL IDENTIFIER LP RP 
			    | CALL buildInFunction
			    ;

argsDef 		    : TYPE IDENTIFIER 
			    | TYPE IDENTIFIER COMMA argsDef
			    ;

argsCall		    : IDENTIFIER 
			    | literal
			    | IDENTIFIER COMMA argsCall
		            | literal COMMA argsCall
			    ;

buildInFunction		    : readInclination 
			    | readAltitude
		            | readTemperature
			    | readAcceleration
			    | videoCameraOn
			    | takePicture
		  	    | readTimeStamp
			    | connectToBaseComputer
			    ;

readInclination 	    : READ_INCLINATION LP RP
			    ;

readAltitude		    : READ_ALTITUDE LP RP
			    ;

readTemperature		    : READ_TEMP LP RP
		    	    ;

readAcceleration	    : READ_ACCELERATION LP RP
			    ;

videoCameraOn		    : VIDEO_CAM_ON LP BOOLEAN RP
			    | VIDEO_CAM_ON LP IDENTIFIER RP
			    ;

takePicture		    : TAKE_PIC LP RP
			    ;

readTimeStamp		    : READ_TIME_STAMP LP RP
			    ;

connectToBaseComputer       : CONNECT_TO_BASE_COMPUTER LP STRING COMMA STRING RP
			    | CONNECT_TO_BASE_COMPUTER LP IDENTIFIER COMMA IDENTIFIER RP
			    ;

%%
#include "lex.yy.c"   
int yylineno;

void yyerror(char *s) 
{
	printf("Syntax error on line %d\n", yylineno);
}
int main(void)
{
	yyparse();
	
	if(yynerrs < 1)
	{
		printf("Input program is valid\n");
	}

	return 0;
}



