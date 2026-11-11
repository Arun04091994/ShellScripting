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


8. or logical operator with if condition

age = 60
if [ "$age" -gt 18 ] || [ '$age' -lt 30 ] 
then 
  echo "valid age"
else
  echo "age not valid"
fi

2nd way

age = 25
if [ "$age" -gt 18 -o '$age' -lt 30 ] 
then 
  echo "valid age"
else
  echo "age not valid"
fi

3d way

age = 25
if [[ "$age" -gt 18 || '$age' -lt 30 ]]
then 
  echo "valid age"
else
  echo "age not valid"
fi

9. arithmatic operations in shell scripting

num1=20
num2=5

echo $(( num1 + num2 ))
echo $(( num1 - num2 ))
echo $(( num1 * num2 ))
echo $(( num1 / num2 ))
echo $(( num1 % num2 ))

2nd way
echo $(expr $num1 + $num2 )
echo $(expr $num1 - $num2 )
echo $(expr $num1 \* $num2 ) --> escape should be used to fix error
echo $(expr $num1 / $num2 )
echo $(expr $num1 % $num2 )

10. arithmatic operations on decimal numbers
we should use bc --> basic calculations

num1=20.5
num2=5

echo "20.5+5" | bc
echo "20.5-5" | bc
echo "20.5*" | bc
echo "20.5/5" | bc
echo "20.5%5" | bc

for division
echo "scale=2;20.5+5" | bc

echo "$num1+$num2" | bc
echo "$num1-$num2" | bc

to find square root
num=27
echo "scale=2;sqrt($num)" | bc -l --> l is used to call math library
echo "scale=2;3^3" | bc -l

man bc --> to check manual

11. case statements
format:
case expression in
  pattern1 )
    statements ;;
  pattern2 )
    statements ;;
  ...
esac

ex:
vehicle=$1
case $vehicle in
  "car" )
    echo "rent of $vehicle is 100 dollar" ;;
  "van" )
    echo "rent of $vehicle is 80 dollar" ;;
  "bicycle" )
    echo "rent of $vehicle is 5 dollar" ;;
  "truck" )
    echo "rent of $vehicle is 150 dollar;;
  *  )
    echo "unknown vehicle" ;;
esac

12. example for case statement
echo -e "enter some character : \c"
read value
case $value in
  [a-z] )
    echo "user entered $value a to z" ;;
  [A-Z] )
    echo "user entered $value A to Z" ;;
  [0-9] )
    echo "user entered $value 0 to 9" ;; 
  ? )
    echo "user entered $value special character" ;;
  * )
    echo "user entered $value A to Z" ;;
esac

note: set below if you are getting incorrect output
LANG=C --> LANG environment variable indicates the language and encoding

13. arrays in shall sscripting

ex
os=('ubuntu' 'windows' 'kali')
echo "${os[@]}"
echo "${os[0]}"
echo "${!os[@]}"
echo "${#os[@]}" --> length of the array
os[3]='mac' --> adding element
unset os[2] --> removing element from the array

string=yuyuyuyccf
echo "${string[@]}"
echo "${string[0]}"
echo "${string[1]}"
echo "${#string[@]}"

14. while loops

syntax:
while [ condition ]
do
  command1
  command2
  command3
done

ex:
n=1
while [ $n -le 10 ] #you can also use (( $n <= 10 ))
do
  echo "$n"
  n=$(( n+1 )) #you can also use n++ or ++n
done

ex2:
n=1
while [ $n -le 10 ] #you can also use (( $n <= 10 ))
do
  echo "$n"
  n=$(( n+1 )) #you can also use n++ or ++n
  sleep 2  ##prints each number after 2 seconds
done

ex3:
ex:
n=1
while [ $n -le 10 ] #you can also use (( $n <= 10 ))
do
  echo "$n"
  n=$(( n+1 )) #you can also use n++ or ++n
  gnome-terminal & ##you can also use "xterm &" to open three terminals
done

15. read files using while loop

type1:
while read p
do
  echo $p
done < hello.sh

type2:
cat hello.sh | while read p
do
  echo $p
done

type3:
while IFS= read -r line #r prevents backslash escape from being interpretent. you can also use IFS=' '. IFS stands for internal field separator.
do
  echo $line
done < hello.sh

16. until loops will be executed till the statement becomes true.
syntax:
until [ condition ]
do
  command1
  command2
  ...
done

ex: 
n=1
until [ $n -ge 10 ] #you can use double parenthesis
do
  echo $n
  n=$(( n+1 ))
done


17. for loops
syntax:
for var in 1 2 3 4 ....N
do
  command1
  command2
  commandN
done

ex:
for i in 1 2 3 4 5 #{1..10} or {1..10..2} to increment with two numbers
do
  echo $i
done

ex2:
for (( i=0; i<5; i++ ))
do 
  echo $i
done

18.for loop use cases
ex:
for command in ls pwd date
do
  echo ".......$command....."
  $command
done

ex2: checking directory or not
for item in *
do
  if [ -d $item ] # -f for checking files
  then
    echo $item
  fi
done


19. selectloop

syntax:
select variable_name in list
do
  command1
  command2
  ...
done

ex1:
select name in mark john tom ben
do
  echo "$name selected"
done

select loop with case statement

syntax:
select name in mark john tom ben
do
  case "$name in
    mark)
     echo mark selected
     ;;
    john)
     echo john selected
     ;;
    tom)
     echo tom selected
     ;;
    ben)
     echo ben selected
     ;;
    *)
     echo "error please provide the number between 1 to 4"
  esac
done

20. break and continue
syntax:
 for ((i=1; i<=10; i++ ))
 do
   if [ i -gt 5 ]
   then
     break
    fi
    echo "$i"
  done

continue:
for ((i=1; i<=10; i++ ))
 do
   if [ $i -eq 3 -o $i -eq 6 ]
   then
     continue
    fi
    echo "$i"
  done

21. functions
syntax:
  function name(){
    commands
  }

  or

  name () {
    commands
  }

ex:
function hello(){
  echo "hello"
}
quit () {
  exit
}

quit # this function quits the script
hello #calling function
echo "foo"

passing arguments to the function
ex:
function print(){
  echo $1 $2
}

print hello world

22. local variables
ex:

function print(){
  name = $1
  echo "name is $1"
}
print max

ex2:
function print(){
  local name = $1 #defining local variable
  echo "name is $name"
}

name="tom"
echo "name is $name: before"
print max
echo "name is $name: after"

23. check file exists or not using functions

usage() {
  echo "you need to provide an argument"
  echo "usage : $0 filename"

is_file_exists() {
  local file="$!"
  [[ -f "$file" ]] && return 0 || return 1
}

[[ $# -eq 0 ]] && usage

if ( is_file_exist "$1")
then
  echo "file found"
else
  echo "file not found"
fi

24. 



  


















