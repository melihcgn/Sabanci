#include <iostream>
#include <string>
#include <vector>
using namespace std;


struct DocumentItem2{
	string docName;
	int count;
	DocumentItem2(string dn, int c){
		docName = dn;
		count = c;
	}
};

class WordItem2{
public:
	string word;
	vector<DocumentItem2> docVec;
	WordItem2(){
		word = "";
	}
	WordItem2(string w){
		word = w;
	}
	bool operator!=(WordItem2 & rhs ){return this->word != rhs.word;	}
	void operator=(WordItem2 & rhs ){word = rhs.word; docVec = rhs.docVec;	}
	bool operator==(WordItem2 & rhs ){return this->word == rhs.word;	}
	bool operator<(WordItem2 & rhs ){return this->word < rhs.word;	}
	bool operator>(WordItem2 & rhs ){return this->word > rhs.word;	}
};




template <class HashedObj>
class HashTable
{
public:
	explicit HashTable(  HashedObj & notFound, int size = 101 );
	HashTable(  HashTable & rhs )
		: ITEM_NOT_FOUND( rhs.ITEM_NOT_FOUND ),
		array( rhs.array ), currentSize( rhs.currentSize ) { }

	 HashedObj & find(  HashedObj & x ) ;

	void makeEmpty( );
	void insert(  HashedObj & x );
	void remove(  HashedObj & x );
	void printLoadFactor();
	 HashTable & operator=(  HashTable & rhs );
	enum EntryType { ACTIVE, EMPTY, DELETED };
private:
	struct HashEntry
	{
		HashedObj element;
		EntryType info;

		HashEntry(  HashedObj e = HashedObj( ), 
			EntryType i = EMPTY )
			: element( e ), info( i ) { }
	};

	vector<HashEntry> array;
	int currentSize;
	 HashedObj ITEM_NOT_FOUND;

	bool isActive( int currentPos ) ;
	int findPos(  HashedObj & x ) ;
	void rehash( );
};


bool isPrime( int n ) // bool function to check the number if it is prime or not
{
	if ( n == 2 || n == 3 )
		return true;

	if ( n == 1 || n % 2 == 0 )
		return false;

	for ( int i = 3; i * i <= n; i += 2 )
		if ( n % i == 0 )
			return false;

	return true;
}


int nextPrime( int n )// to find the next prime after the number (n)
{
	if ( n % 2 == 0 )
		n++;

	for ( ; ! isPrime( n ); n += 2 )
		;

	return n;
}



int hashT( WordItem2 & key, int tableSize )  // hash function that works for the string according to our homework's rules
{
	int hashVal = 0;
	string keyEle = key.word;
	for( int i = 0; i < keyEle.length(); i++ )
		hashVal = hashVal * 37 + keyEle[ i ];

	hashVal = hashVal % tableSize;
	if( hashVal < 0 ){
		hashVal = hashVal + tableSize;
	}
	return hashVal;
}


template <class HashedObj>
void HashTable<HashedObj>::printLoadFactor()
{
	cout <<"After preprocessing, the unique word count is " << currentSize << ". current load ratio is " << double(currentSize)/array.size() << endl;
}

template <class HashedObj>
HashTable<HashedObj>::HashTable(  HashedObj & notFound, 
								int size )
								: ITEM_NOT_FOUND( notFound ), array( nextPrime( size ) )
{
	currentSize = 0;
}


template <class HashedObj>
int HashTable<HashedObj>::findPos(  HashedObj & x ) 
{
	int collisionNum = 0;
	int currentPos = hashT( x, array.size( ) );

	while ( array[ currentPos ].info != EMPTY && 
		array[ currentPos ].element != x )
	{
		currentPos += pow(++collisionNum, 2) ;  //add the difference
		if ( currentPos >= array.size( ) )              // perform the mod
			currentPos = currentPos - array.size( );                // if necessary
	}
	return currentPos;
}

template <class HashedObj>
bool HashTable<HashedObj>::isActive( int currentPos ) 
{
	return array[ currentPos ].info == ACTIVE;
}

template <class HashedObj>
void HashTable<HashedObj>::remove(  HashedObj & x )
{
	int currentPos = findPos( x );
	if ( isActive( currentPos ) )
		array[ currentPos ].info = DELETED;
}

template <class HashedObj>
 HashedObj & HashTable<HashedObj>::find(  HashedObj & x ) 
	
{
	int currentPos = findPos( x );
	if (isActive( currentPos )) 
		return array[ currentPos ].element; 

	return   ITEM_NOT_FOUND;
}

template <class HashedObj>
void HashTable<HashedObj>::rehash( )
{
	vector<HashEntry> oldArray = array;
	// Create new double-sized, empty table
	array.resize( nextPrime( 2 * oldArray.size( ) ) );
	for ( int j = 0; j < array.size( ); j++ )
		array[ j ].info = EMPTY;

	// Copy table over
	currentSize = 0;
	for ( int i = 0; i < oldArray.size( ); i++ )
		if ( oldArray[ i ].info == ACTIVE )
			insert( oldArray[ i ].element );
	cout << "rehashed..." << endl;
	cout << "previous table size:" << oldArray.size() << ", new table size: " << array.size() << ", current unique word count: " << currentSize << ", current load factor: " << double(currentSize)/array.size() << endl;
}

template <class HashedObj>
void HashTable<HashedObj>::insert(  HashedObj & x )
{
	// Insert x as active
	int currentPos = findPos( x );
	if ( isActive( currentPos ) )
		return;
	array[ currentPos ] = HashEntry( x, ACTIVE );

	// enlarge the hashT table if necessary 
	if ( ++currentSize >= array.size( ) / 2 )
		rehash( );
}




