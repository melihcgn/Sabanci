#include <iostream>
#include <string>
#include <vector>
using namespace std;


template <class Comparable>
class BinarySearchTree;

template <class Comparable>
struct DocumentItem{
	string docName;
	int count;
	DocumentItem(string dn, int c){
		docName = dn;
		count = c;
	}
};

template <class Comparable>
class BinaryNode
{
public:
	Comparable element; // our word
	vector<DocumentItem<Comparable>> docList;

	BinaryNode  *left;
	BinaryNode  *right;
	BinaryNode( const Comparable & theElement, 
		BinaryNode *lt, BinaryNode *rt  )
		: element( theElement ), left( lt ), right( rt ) { }

	friend class BinarySearchTree<Comparable>;
};




template <class Comparable>
class BinarySearchTree
{
public:
	explicit BinarySearchTree( const Comparable & notFound );
	BinarySearchTree( const BinarySearchTree & rhs );
	~BinarySearchTree( );

	const Comparable & findMin( ) const;
	const Comparable & findMax( ) const;
	const Comparable & find( const Comparable & x ) const;
	bool isEmpty( ) const;
	void printTree( ) const;

	void makeEmpty( );
	void insert( const Comparable & x );
	void remove( const Comparable & x );
	BinaryNode<Comparable> * findNode( const Comparable & x ) const;
	const BinarySearchTree & operator=( const BinarySearchTree & rhs );
private:
	BinaryNode<Comparable> *root;
	const Comparable ITEM_NOT_FOUND;

	const Comparable & elementAt( BinaryNode<Comparable> *t ) const;

	void insertPriv( const Comparable & x, BinaryNode<Comparable> * & t ) const;
	void removePriv( const Comparable & x, BinaryNode<Comparable> * & t ) const;
	BinaryNode<Comparable> * findMinPriv( BinaryNode<Comparable> *t ) const;
	BinaryNode<Comparable> * findMaxPriv( BinaryNode<Comparable> *t ) const;
	BinaryNode<Comparable> * findPriv( const Comparable & x, 
	BinaryNode<Comparable> *t ) const;
	void makeEmptyPriv( BinaryNode<Comparable> * & t ) const;
	void printTreePriv( BinaryNode<Comparable> *t ) const;
	BinaryNode<Comparable> * clone( BinaryNode<Comparable> *t ) const;
};

template <class Comparable>
BinarySearchTree<Comparable>::
	BinarySearchTree(const Comparable & notFound ) :
	ITEM_NOT_FOUND( notFound ), root( NULL )
{
}
template <class Comparable>
const Comparable & BinarySearchTree<Comparable>::
	elementAt( BinaryNode<Comparable> *t ) const
{
	return t == NULL ? ITEM_NOT_FOUND : t->element;
}
template <class Comparable>
const Comparable & BinarySearchTree<Comparable>::
	find( const Comparable & x ) const
{
	return elementAt( findPriv( x, root ) );
}

template <class Comparable>
BinaryNode<Comparable> * BinarySearchTree<Comparable>::
	findNode( const Comparable & x ) const
{
	return  findPriv( x, root ) ;
}

template <class Comparable>
BinaryNode<Comparable> *
	BinarySearchTree<Comparable>::
	findPriv( const Comparable & x, BinaryNode<Comparable> * t ) const
{
	if ( t == NULL )
		return NULL;
	else if( x < t->element )
		return findPriv( x, t->left );
	else if( t->element < x )
		return findPriv( x, t->right );
	else
		return t;    // Match
}


template <class Comparable>
const Comparable & BinarySearchTree<Comparable>::findMin( ) const
{
	return elementAt( findMinPriv( root ) );
}
template <class Comparable>
BinaryNode<Comparable> *
	BinarySearchTree<Comparable>::findMinPriv( BinaryNode<Comparable> *t ) 
	const
{
	if( t == NULL )
		return NULL;
	if( t->left == NULL )
		return t;
	return findMinPriv( t->left );
}
template <class Comparable>
const Comparable & BinarySearchTree<Comparable>::findMax( ) const
{
	return elementAt( findMaxPriv( root ) );
}
template <class Comparable>
BinaryNode<Comparable> *
	BinarySearchTree<Comparable>::findMaxPriv( BinaryNode<Comparable> *t ) 
	const
{
	if( t != NULL )
		while( t->right != NULL )
			t = t->right;
	return t;
}
template <class Comparable>
void BinarySearchTree<Comparable>::insert( const Comparable & x )
{
	insertPriv( x, root );
}
template <class Comparable>
void BinarySearchTree<Comparable>::
	insertPriv( const Comparable & x, BinaryNode<Comparable> * & t ) const
{

	if( t == NULL ) //  create a new node at the right place
		t = new BinaryNode<Comparable>( x, NULL, NULL );
	else if( x < t->element )
		insertPriv( x, t->left );  // insert at the left or 
	else if( t->element < x )
		insertPriv( x, t->right );  // right subtree
	else
		;  // Duplicate; do nothing
}
template <class Comparable>
void BinarySearchTree<Comparable>::remove
	( const Comparable & x )
{
	removePriv( x, root );
}
template <class Comparable>
void BinarySearchTree<Comparable>::
	removePriv( const Comparable & x, BinaryNode<Comparable> * & t ) 
	const
{
	if( t == NULL )
		return;   // Item not found; do nothing
	if( x < t->element )
		removePriv( x, t->left );
	else if( t->element < x )
		removePriv( x, t->right );            
	else if( t->left != NULL && t->right != NULL ) // Two children
	{
		t->element = findMin( t->right )->element;
		removePriv( t->element, t->right );
	}
	else // one or no children
	{
		BinaryNode<Comparable> *oldNode = t;
		t = ( t->left != NULL ) ? t->left : t->right;
		delete oldNode;
	}
}        
template <class Comparable>
void BinarySearchTree<Comparable>::makeEmpty( )
{
	makeEmptyPriv( root );
}


template <class Comparable>
void BinarySearchTree<Comparable>::
	makeEmptyPriv( BinaryNode<Comparable> * & t ) const
{
	if( t != NULL )
	{
		makeEmptyPriv( t->left );
		makeEmptyPriv( t->right );
		delete t;
	}
	t = NULL;
}

template <class Comparable>
bool BinarySearchTree<Comparable>::isEmpty() const
{return root == NULL;}

/*
template <class Comparable>
void BinarySearchTree<Comparable>::printTree( ) const
{
	if( isEmpty( ) )
		cout << "Empty tree" << endl;
	else
		printTree( root );
}
*/

template <class Comparable>
BinarySearchTree<Comparable>::~BinarySearchTree( )
{
	makeEmpty( );
}


template <class Comparable>
BinarySearchTree<Comparable>::
	BinarySearchTree( const BinarySearchTree<Comparable> & rhs ) :
	root( NULL ), ITEM_NOT_FOUND( rhs.ITEM_NOT_FOUND )
{ 
	*this = rhs;
}

