cat /etc/shells
which bash

1.just print hello world
echo "hello, world"

2. comments and variables
system variables --> maintaining by OS. it will be in uppercases. $BASH, $BASH_VERSION, $HOME, $PWD
user variables --> user defined variables. 
ex: 
name=mark
echo the name is $name

3. passing the arguments
echo $1 $2 $3 
$0 --> script name

args=("$@") --> parsing all arguments into array
echo ${args[1]} ${args[2]} ${args[3]}
echo $@ --> to print all arguments
echo $# --> to print number of arguments

4. if statement
if [ condition ]
then
  statement
fi

Expressions 
An expression can be: String comparison, Numeric comparison, File operators and Logical operators and it is represented by [expression]:
String Comparisons:  
---------------------------------
=  compare if two strings are equal
!=  compare if two strings are not equal
-n  evaluate if string length is greater than zero
-z  evaluate if string length is equal to zero 

Examples: 
[ s1 = s2 ]  (true if s1 same as s2, else false)
[ s1 != s2 ]  (true if s1 not same as s2, else false)
[ s1 ]   (true if s1 is not empty, else false)
[ -n s1 ]   (true if s1 has a length greater then 0, else false)
[ -z s2 ]   (true if s2 has a length of 0, otherwise false)

Number Comparisons: 
------------------------------------
-eq compare if two numbers are equal
-ge compare if one number is greater than or equal to a number
-le  compare if one number is less than or equal to a number
-ne  compare if two numbers are not equal
-gt  compare if one number is greater than another number
-lt  compare if one number is less than another number 

Examples: 
[ n1 -eq n2 ]  (true if n1 same as n2, else false)
[ n1 -ge n2 ]  (true if n1greater then or equal to n2, else false)
[ n1 -le n2 ]  (true if n1 less then or equal to n2, else false)
[ n1 -ne n2 ]  (true if n1 is not same as n2, else false)
[ n1 -gt n2 ]  (true if n1 greater then n2, else false)
[ n1 -lt n2 ]  (true if n1 less then n2, else false)


ex:
count = 10
if [ $count = 9 ]
then
  echo "condition is true"
fi

ex2:
ex:
count = 10
if [ $count > 9 ]
then
  echo "condition is true"
fi

you can use with double parenthesis also
count = 10
if (( $count > 9 ))
then
  echo "condition is true"
fi

ex3: string comparison. you can use single = or double ==. 
word = abc
if [ $word = "abc" ]
then
  echo "condition is true"
fi

ex4.for > you need to use double square brasis.
word=a
if [[ $word < "b" ]]
then
  echo "condition is true"
fi

ex5. else condition
word=a
if [[ $word == "b" ]]
then
  echo "condition is true"
else
  echo "condition is false"
fi

ex6. elif
word=a
if [[ $word == "b" ]]
then
  echo "condition is true"
elif [[ $word == "a"]]
then
  echo "condition is true"
else
  echo "condition is false"
fi


5. use case of if elif and else
echo -e "enter the name of the file : \c" --> e is for interpretting the back slash
read file_name

#e flag is used to check whether file exists or not, 
f is to check file exists and its a regular file or not, 
d is used to check directory. 
b for block special file. 
c for charector special. 
s is used to check whether file is empty or not
r,w and x for checking read, write and execute permissions for the file.

if [ -e $file_name ]  
then 
  echo "$file_name found"
else
  echo "$file_name not found"
fi

6. use cases
echo -e "enter the name of the file : \c"
read file_name

if [ -f $file_name ]
then
  if [ -w $file_name ]
  then 
    echo "type some text data. to quit press control+d."
    cat >> $file_name
  else
    echo "$file_name do not have write permissions"
  fi
else
  echo "$file_name not exists"
fi

7. how to use && operators with if statement

age = 25
if [ "$age" -gt 18 ] && [ '$age' -lt 30 ] 
then 
  echo "valid age"
else
  echo "age not valid"
fi

2nd way
if [ "$age" -gt 18 -a '$age' -lt 30 ] 
then 
  echo "valid age"
else
  echo "age not valid"
fi

3d way
if [[ "$age" -gt 18 && '$age' -lt 30 ]]
then 
  echo "valid age"
else
  echo "age not valid"
fi












