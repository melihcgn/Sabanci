#include <iostream>
#include <string>
#include <vector>

using namespace std; 

//NOTE: all the sorts taken from the Gulesn Hoca's lectures, but there added functions which are defined at below

/**
* Standard swap
*/
template <class Comparable>
void swapA( Comparable & obj1, 
		   Comparable & obj2 )
{
	Comparable tmp = obj1;
	obj1 = obj2;
	obj2 = tmp;
}

/** Return median of left, center, and right.
*   Order these and hide the pivot.
*/
template <class Comparable>
const Comparable & median3( vector<Comparable> & a, int left, int right )
{
	int center = ( left + right ) / 2;
	if ( a[ center ] < a[ left ] )
		swapA( a[ left ], a[ center ] );
	if ( a[ right ] < a[ left ] )
		swapA( a[ left ], a[ right ] );
	if ( a[ right ] < a[ center ] )
		swapA( a[ center ], a[ right ] );

	// Place pivot at position right - 1
	swapA( a[ center ], a[ right - 1 ] );
	return a[ right - 1 ];
}


template <class Comparable>
void insertionSort( vector<Comparable> & a, int left, int right )
{
	for ( int p = left + 1; p <= right; p++ )
	{
		Comparable tmp = a[ p ];
		int j;

		for ( j = p; j > left && tmp < a[ j - 1 ]; j-- )
			a[ j ] = a[ j - 1 ];
		a[ j ] = tmp;
	}
}



/**
* Internal quicksort method that makes recursive calls.
* Uses median-of-three partitioning and a cutoff of 10.
* a is an array of Comparable items.
* left is the left-most index of the subarray.
* right is the right-most index of the subarray.
*/
template <class Comparable>
void quicksort( vector<Comparable> & a, 
			   int left, int right )
{
	if ( left + 10 <= right )
	{
		Comparable  pivot = median3( a, left, right );
		int i = left, j = right - 1;
		for ( ; ; )
		{
			while ( a[ ++i ] < pivot ) { }

			while ( pivot < a[ --j ] ) { }

			if ( i < j )
				swapA( a[ i ], a[ j ] );
			else
				break;
		}
		swapA( a[ i ], a[ right - 1 ] );   // Restore pivot

		quicksort( a, left, i - 1 );       // Sort small elements
		quicksort( a, i + 1, right );    // Sort large elements
	}
	else  // Do an insertion sort on the subarray
		insertionSort( a, left, right );
}


/**
* Quicksort algorithm (driver).
*/
template <class Comparable>
void quicksortMain( vector<Comparable> & a )
{
	quicksort( a, 0, a.size( ) - 1 );
}

template <class Comparable>
void insSortMain( vector<Comparable> & a )
{
	insertionSort( a, 0, a.size( ) - 1 );
}


//HEAP SORT
inline int leftChild( int i )
{
	return 2*i+1;
}


template <class Comparable>
void heapSort(vector<Comparable> & a)
{
	// buildHeap
	for (int i = a.size()/2; i >=0; i = i-1)
		percDown(a, i, a.size());

	// sort

	for (int j = a.size() -1 ; j >0; j = j-1)
	{
		swapA(a[0], a[j]);    // swap max to the last pos.
		percDown(a, 0, j); // re-form the heap
	}
}

template <class Comparable>  // for deleteMax
// a is the array, i is the position to percolate down from
// n is the logical size of the array
void percDown( vector<Comparable> & a, int i, int n )
{
	int child;
	Comparable tmp;

	for (tmp=a[i] ; leftChild(i) < n; i = child )
	{
		child = leftChild(i);
		if ( child != n-1 && a[ child  ] < a[ child+1 ] )
			child++;
		if ( a[child ] > tmp )
			a[i] = a[ child ];
		else
			break;
	} 
	a[ i ] = tmp;
}


//MERGE SORT

/**
* Mergesort algorithm (driver).
*/
template <class Comparable>
void mergeSortMain( vector<Comparable> & a )
{
	vector<Comparable> tmpArray( a.size( ) );

	mergeSort( a, tmpArray, 0, a.size( ) - 1 );
}

template <class Comparable>
void mergeSort( vector<Comparable> & a,
			   vector<Comparable> & tmpArray, int left, int right )
{
	if ( left < right )
	{
		int center = ( left + right ) / 2;
		mergeSort( a, tmpArray, left, center );
		mergeSort( a, tmpArray, center + 1, right );
		merge( a, tmpArray, left, center + 1, right );
	}
}

template <class Comparable>
void merge(  vector<Comparable> & a, 
		   vector<Comparable> & tmpArray,
		   int leftPos, int rightPos, int rightEnd )
{
	int leftEnd = rightPos - 1;
	int tmpPos = leftPos;
	int numElements = rightEnd - leftPos + 1;
	while ( leftPos <= leftEnd && rightPos <= rightEnd )
		if ( a[ leftPos ] <= a[ rightPos ] )
			tmpArray[ tmpPos++ ] = a[ leftPos++ ];
		else
			tmpArray[ tmpPos++ ] = a[ rightPos++ ];

	while ( leftPos <= leftEnd )    // Copy rest of first half
		tmpArray[ tmpPos++ ] = a[ leftPos++ ];

	while ( rightPos <= rightEnd )  // Copy rest of right half
		tmpArray[ tmpPos++ ] = a[ rightPos++ ];

	// Copy tmpArray back
	for ( int i = 0; i < numElements; i++, rightEnd-- )
		a[ rightEnd ] = tmpArray[ rightEnd ];
}

template <class Comparable>
int binarySearchMain(vector<Comparable> vec, Comparable x) // these two functions are made to make easier to write the functions in the main
{
	return binarySearch(vec, 0 , vec.size()-1, x);
}

template <class Comparable>
int binarySearchPartial(vector<Comparable> vec, Comparable x)
{
	return binarySearchPart(vec, 0 , vec.size()-1, x);
}


template <class Comparable>

int binarySearch(vector<Comparable> & vec, int l, int r, Comparable& x) //it is made for the binary search with full name
{
	
    if (r >= l) {
        int mid = l + (r - l) / 2;
 
        if (vec[mid] == x)
            return mid;

        if (vec[mid] > x)
            return binarySearch(vec, l, mid - 1, x);
 
        return binarySearch(vec, mid + 1, r, x);
    }
 
    return -1;
}

template <class Comparable>

int binarySearchPart(vector<Comparable> & vec, int l, int r, Comparable& x) // it is made for the binary search with partial name
{
	
    if (r >= l) {
        int mid = l + (r - l) / 2;
 
		if (vec[mid].findPartialIdx(x) && !vec[mid-1].findPartialIdx(x))
			return mid;
 
        if (vec[mid] >= x)
            return binarySearchPart(vec, l, mid - 1, x);
 
        return binarySearchPart(vec, mid + 1, r, x);
    }
 
    return -1;
}

template <class Comparable>
int seqSearchMainFull(vector<Comparable> vec,  Comparable x)
{
	return seqSearch(vec, vec.size() ,x);
}

template <class Comparable>
int seqSearchMainPartial(vector<Comparable> vec,  Comparable x)
{
	return seqSearchPart(vec, vec.size() ,x);
}


template <class Comparable>
int seqSearchPart(vector<Comparable> vec, int n, Comparable x) // it is made for the sequential search with partial name
{
    int i;
    for (i = 0; i < n; i++)
        if (vec[i].findPartialIdx(x))
            return i;
    return -1;
}

template <class Comparable>
int seqSearch(vector<Comparable> vec, int n, Comparable x) // it is made for the sequential search with full name
{
    int i;
    for (i = 0; i < n; i++)
        if (vec[i] == x)
            return i;
    return -1;
}


