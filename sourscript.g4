grammar sourscript;

script: scope EOF;
scope: expression*;

expression
  : ('+' | '-' | '!' | '~') expression
  | expression '..' expression
  | expression ('**') expression
  | expression ('*' | '/' | '%') expression
  | expression ('+' | '-') expression
  | expression ('<<' | '>>') expression
  | expression ('<' | '<=' | '==' | '!=' | '>' | '>=') expression
  | expression ('&' | '|' | '^') expression
  | expression ('&&' | '||') expression
  | expressionBlock
  | expressionAssignment
  | expressionExpose
  | expressionIf
  | expressionLoop
  | expressionSkip
  | expressionCall
  | expressionAccess
  | expressionFunction
  | expressionExit
  | expressionList
  | value
  | '(' expression ')'
  ;

expressionBlock: '{' scope '}';
expressionAssignment: expressionAccess '=' (expression | 'use' (IDENTIFIER | STRING));
expressionExpose: '<:' (expressionAssignment | IDENTIFIER);
expressionIf: 'if' '(' expression ')' expression ('else' expression)?;
expressionLoop: 'loop' ('(' (IDENTIFIER 'in')? (IDENTIFIER | NUMBER | expressionList) ('as' IDENTIFIER)? ')')? expression;
expressionSkip: 'skip' 'all'?;
expressionAccess: IDENTIFIER ('.' IDENTIFIER | '[' expression ']')*;
expressionCall: expressionAccess '(' expression* ')';
expressionFunction: ('(' IDENTIFIER* ')' | IDENTIFIER) '->' expression;
expressionExit: 'exit' expression?;
expressionList: '[' (expression)* ']';

value
  : IDENTIFIER
  | VOID
  | BOOLEAN
  | STRING
  | NUMBER
  ;

VOID: 'void';
BOOLEAN: 'true' | 'false';
STRING: STRING_SINGLE | STRING_DOUBLE;
NUMBER: NUMBER_DEC | NUMBER_BIN | NUMBER_HEX;

STRING_SINGLE: '\'' ~['\r\n]* '\'';
STRING_DOUBLE: '"' ~["\r\n]* '"';

NUMBER_DEC: [0-9]+ ('.' [0-9]+)? ('e' '-'? [0-9]+)?;
NUMBER_BIN: '0' [bB] [0-1]+;
NUMBER_HEX: '0' [xX] [0-9a-fA-F]+;

IDENTIFIER: [_$a-zA-Z][_$a-zA-Z0-9]*;

WS: [ \t\r\n,]+ -> skip;
COMMENT_BLOCK: '/*' .*? '*/' -> skip;
COMMENT_LINE: '//' ~[\r\n]* -> skip;
