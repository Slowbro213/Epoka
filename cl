#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
int isNumber(char s[])
{
    for (int i = 0; s[i]; i++)
        if (!isdigit(s[i]))
            return 0;
    return 1;
}
void addition()
{
    double a,b;
    printf("Enter the 2 numbers you want to add together:\n");
    scanf("%lf%lf",&a,&b);
    printf("%lf",a+b);
}
void subtraction()
{
    double a,b;
    printf("Enter the 2 numbers you want to subtract:\n");
    scanf("%lf%lf",&a,&b);
    printf("%lf",a-b);
}
void multiplication()
{
    double a,b;
    printf("Enter the 2 numbers you want to multiply together:\n");
    scanf("%lf%lf",&a,&b);
    printf("%lf",a*b);
}
void division()
{
    double a,divisor;
    printf("Enter the 2 numbers you want to divide:\n");
    scanf("%lf%lf",&a,&divisor);
    while(divisor==0)
    {
        printf("Error, Cant divide with zero. Enter the correct divisor\n");
        scanf("%lf",&divisor);
    }
    printf("%lf",a/divisor);
}
double power(double base,int exponent)
{
    int i,j=1;
    for(i=0;i<exponent;i++)
    {
        j*=base;
    }
    return j;
}
void square_root()
{
    double number;
    printf("Enter number:\n");
    scanf("%lf",&number);
    number=sqrt(number);
    printf("%lf",number);
}
void calculate_average()
{
    int counter=1;
    char input_by_user[20];
    char *endptr;
    double number=1;
    double sum=0;
    printf("Enter Numbers:\n");
    while (1)
    {
        scanf("%s",input_by_user);
       if (!(isNumber(input_by_user)))
            break;
        number=strtod(input_by_user,&endptr);
        sum+=number;
        counter++;
    }
    sum=sum/(counter-1);
    printf("%lf",sum);

}

int main()
{
    char operatation[5];
    printf("Enter the operation you want to perform | + | - | * | / | ^ | sqrt(square root) | a(average of numbers) |\n");
    scanf("%s",operatation);
    while(operatation[0]!='+' && operatation[0]!='-' && operatation[0]!='*' && operatation[0]!='/' && operatation[0]!='^' && strcmp(operatation,"sqrt") && operatation[0]!='a')
    {
        printf("Enter a valid operator\n");
        scanf("%s",operatation);
    }
    if(operatation[0]=='+')
        addition();
    else if(operatation[0]=='-')
        subtraction();
    else if(operatation[0]=='*')
        multiplication();
    else if(operatation[0]=='/')
        division();
    else if(operatation[0]=='^')
    {
        double base;
        int exponent;
        printf("Enter the base:\n");
        scanf("%lf",&base);
        printf("Enter the exponent:\n");
        scanf("%d",&exponent);
        if(exponent==0)
        {
            printf("0");
            return 0;
        }
        if(exponent<0)
        {
            exponent=exponent*-1;
            base=power(base,exponent);
            base=1/base;
        }
        else
            base=power(base,exponent);
        printf("%lf",base);
    }
    else if(operatation[0]=='a')
    {
        calculate_average();
    }
    else
    square_root();

    return 0;
}