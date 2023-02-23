# Python3 program to add two numbers
 
num1 = 15
num2 = 12
 
# Adding two nos
sum = num1 + num2
 
# printing values
print("Sum of {0} and {1} is {2}" .format(num1, num2, sum))

# Python program to find the
# maximum of two numbers
 
 
def maximum(a, b):
     
    if a >= b:
        return a
    else:
        return b
     
# Driver code
a = 2
b = 4
print(maximum(a, b))

# Python 3 code to find sum
# of elements in given array
 
 
def _sum(arr):
 
    # initialize a variable
    # to store the sum
    # while iterating through
    # the array later
    sum = 0
 
    # iterate through the array
    # and add each element to the sum variable
    # one at a time
    for i in arr:
        sum = sum + i
 
    return(sum)
 
 
# driver function
arr = []
# input values to list
arr = [12, 3, 4, 15]
 
# calculating length of array
n = len(arr)
 
ans = _sum(arr)
 
# display sum
print('Sum of the array is ', ans)

# Python program for reversal algorithm of array rotation
 
# Function to reverse arr[] from index start to end
def rverseArray(arr, start, end):
    while (start < end):
        temp = arr[start]
        arr[start] = arr[end]
        arr[end] = temp
        start += 1
        end = end-1
 
# Function to left rotate arr[] of size n by d
def leftRotate(arr, d):
    n = len(arr)
    rverseArray(arr, 0, d-1)
    rverseArray(arr, d, n-1)
    rverseArray(arr, 0, n-1)
 
# Function to print an array
def printArray(arr):
    for i in range(0, len(arr)):
        print (arr[i])
 
# Driver function to test above functions
arr = [1, 2, 3, 4, 5, 6, 7]
leftRotate(arr, 2) # Rotate array by 2
printArray(arr)
 
# This code is contributed by Devesh Agrawal

# Python program to find N largest
# element from given list of integers
 
# Function returns N largest elements
def Nmaxelements(list1, N):
    final_list = []
 
    for i in range(0, N):
        max1 = 0
         
        for j in range(len(list1)):    
            if list1[j] > max1:
                max1 = list1[j];
                 
        list1.remove(max1);
        final_list.append(max1)
         
    print(final_list)
 
# Driver code
list1 = [2, 6, 41, 85, 0, 3, 7, 6, 10]
N = 2
 
# Calling the function
Nmaxelements(list1, N)