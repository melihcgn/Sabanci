#include <iostream>
#include <string>
#include <vector>

using namespace std;

template <class Comparable>
int binarySearchMain(vector<Comparable> vec, Comparable x)
{
	return binarySearch(vec, 0 , vec.size()-1, x);
}


template <class Comparable>

int binarySearch(vector<Comparable> vec, int l, int r, Comparable x)
{
	
    if (r >= l) {
        int mid = l + (r - l) / 2;
 
        if (vec[mid] == x)
            return mid;
 
        // If element is smaller than mid, then
        // it can only be present in left subarray
        if (vec[mid] > x)
            return binarySearch(vec, l, mid - 1, x);
 
        // Else the element can only be present
        // in right subarray
        return binarySearch(vec, mid + 1, r, x);
    }
 
    // We reach here when element is not
    // present in array
    return -1;
}