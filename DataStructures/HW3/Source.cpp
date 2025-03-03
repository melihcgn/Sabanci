#include <iostream>
#include <string>
#include <list>
#include "BST.h"
#include "HashTable.h"
#include <vector>
#include <sstream>
#include <fstream>
#include <chrono>
#include <thread>
using namespace std;
// IMPORTANT NOTE: When you trying to samples on this code, after write the queired words, please write CTRL+Z and enter, it will work that way

WordItem2 notFoundItem("");
const string notFound = "";
BinarySearchTree<string> mainTree(notFound);
HashTable<WordItem2> mainHashTable(notFoundItem, 101);

// it is built for to add element to BST's vector
void upgradingVector (vector<DocumentItem<string>> & vec, string txtFile)
{
	for (int i = 0; i < vec.size(); i++)
	{
		if (vec[i].docName == txtFile)
		{
			vec[i].count++;
			return;
		}
	}
	DocumentItem<string> item(txtFile,1 );
	vec.push_back(item);	
}
// it is built for to add element to HT's vector
void upgradingVectorForHash (vector<DocumentItem2> & vec, string txtFile)
{
	for (int i = 0; i < vec.size(); i++)
	{
		if (vec[i].docName == txtFile)
		{
			vec[i].count++;
			return;
		}
	}
	DocumentItem2 item(txtFile,1 );
	vec.push_back(item);
}
// it is built for to build the lines which are from the texts according t the rules of the homeworks
void adjustingLine(string &line){
	for (int i = 0; i < line.length(); i++)
	{
		line[i] = tolower(line[i]);
		if (!(line[i] < 123 &&  line[i] > 96))
		{
			line[i] = ' ';
		}
	}
}
// the function that reads the file with help of "adjustingLine" function and forming BST's and HT's classes
void readingFile(string file){
	ifstream in;
	in.open(file.c_str());
	string line;
	while (getline(in, line))
	{
		adjustingLine(line);
		istringstream is(line);
		string word;
		BinaryNode<string>* tempNode = NULL;

		while (is >> word)
		{
			WordItem2 mainItem(word), tempItem("");
			if (mainTree.findNode(word) == NULL)
			{
				mainTree.insert(word); // inserting and adding first item to its vector in BST
				tempNode = mainTree.findNode(word);
				DocumentItem<string> item(file,1 );
				tempNode->docList.push_back(item);
			}
			else
			{

				tempNode = mainTree.findNode(word);
				upgradingVector(tempNode->docList, file);
			}
			if (mainHashTable.find(mainItem)== notFoundItem) 
			{
				mainHashTable.insert(mainItem);// inserting and adding first item to its vector in HT
				DocumentItem2 item(file,1 );
				mainHashTable.find(mainItem).docVec.push_back(item);
			}
			else
			{
				WordItem2* tempIt = &mainHashTable.find(mainItem);
				upgradingVectorForHash(tempIt->docVec, file);
			}

		}
	}
	in.close();
}


int main(){
	vector<string> files;
	string  fileName, queriedW;
	int fileNumber, tempN;
	cout << "Enter number of input files: ";
	cin >> fileNumber;
	tempN = fileNumber;
	for (int i = 0; i < tempN; i++)
	{
		cout << "Enter "<< i+1<< ". file name: ";
		cin >> fileName;
		files.push_back(fileName);
	}
	for (int i = 0; i < files.size(); i++)
	{
		readingFile(files[i]);
	}
	mainHashTable.printLoadFactor();
	vector<string> allInputs;
	cout << "Enter queried words in one line: " ;
	string qWord;
	while (getline(cin,qWord)) // taking queried words to search and write the informations in the our HT and BST about them
	{

		adjustingLine(qWord);
		istringstream input(qWord);
		while (input>> queriedW)
		{
			allInputs.push_back(queriedW); //pushing the inputs a certain vector to process later on
		}
	}

	int num = 20;
	cout << endl<< "--------------------------------------------"<<endl; // i built them for you to understand and see better
	cout << "BST IMPLEMENTATION" << endl;
	cout<< "--------------------------------------------"<<endl << endl;
	auto start = std::chrono::high_resolution_clock::now();
	//BST IMPLEMENTATION
	for (int a = 0; a < num; a++)
	{

		bool  docCheck = false;
		for (int i = 0; i < files.size(); i++) // there are three 'for' loops to compare and find the document names and get the informations to write output 
		{
			string output = "";
			int countOut = 0;
			bool exCheck = false;
			for (int k = 0; k < allInputs.size(); k++)
			{
				if (mainTree.findNode(allInputs[k]) != NULL)
				{

					for (int l = 0; l < mainTree.findNode(allInputs[k])->docList.size(); l++)
					{
						if (files[i] == mainTree.findNode(allInputs[k])->docList[l].docName)
						{

							if (exCheck == false)
							{
								output += "in Document " + files[i];
								exCheck = true;
							}
							output += ", "+mainTree.findNode(allInputs[k])->element + " found " + to_string(mainTree.findNode(allInputs[k])->docList[l].count)+" times";
							countOut++;
						} 
					}

				}

			}
			if (exCheck)
			{
				output += ".";
			}
			if (allInputs.size() == countOut)
			{
				docCheck = true;
				cout << output << endl;
			}
		}
		if (!docCheck)
		{
			cout << "No document contains the given query" << endl;
		}

	}
	auto BSTTime = std::chrono::duration_cast<std::chrono::nanoseconds>
		(std::chrono::high_resolution_clock::now() -
		start);
	cout << endl<< "--------------------------------------------"<<endl;
	cout << "HASHTABLE IMPLEMENTATION" << endl;
	cout<< "--------------------------------------------"<<endl << endl;

	start = std::chrono::high_resolution_clock::now();
	//HASHTABLE IMPLEMENTATION
	for (int b = 0; b < num; b++) 
	{

		bool docCheck = false;
		for (int i = 0; i < files.size(); i++)
		{
			string theFile = files[i];
			string output = "";
			int countOut = 0;
			bool exCheck = false;
			for (int k = 0; k < allInputs.size(); k++) // There are also three 'for' loops in HT implementation and does almost the same operations as the BST's one but the HT'S class is faster.
			{
				WordItem2  wantedH(allInputs[k]);
				WordItem2 queriedH = mainHashTable.find(wantedH);
				if (queriedH.word != "")
				{

					for (int l = 0; l < queriedH.docVec.size(); l++)
					{
						DocumentItem2 mainVec = queriedH.docVec[l];
						if (files[i] == mainVec.docName)
						{

							if (exCheck == false)
							{

								output += "in Document "+files[i];
								exCheck = true;
							}
							output += ", "+queriedH.word + " found "+ to_string(mainVec.count)+" times";
							countOut++;
						} 
					}
				}
			}
			if (exCheck) // just to puat a dot in end fo the output
			{
				output += ".";
			}
			if (allInputs.size() == countOut) 
			{
				docCheck = true;
				cout << output << endl;

			}
		}
		if (!docCheck) // to generalize, docCheck works if there is output it returns true, else false
		{
			cout << "No document contains the given query" << endl;
		}
	}

	auto HTTime = std::chrono::duration_cast<std::chrono::nanoseconds>
		(std::chrono::high_resolution_clock::now() - start);
	cout << "\nTime: " << BSTTime.count()/num << "\n";
	cout << "\nTime: " << HTTime.count()/num << "\n" << endl;
	cout << "Speed Up: " << double(BSTTime.count()) / HTTime.count() << endl;
}
