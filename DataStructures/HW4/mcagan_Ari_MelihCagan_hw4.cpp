#include <iostream>
#include <string>
#include"SortsSearches.h"
#include <sstream>
#include <fstream>
#include <chrono>
using namespace std;

struct PhoneInfo // struct to keep the datas in the files
{
	string name;
	string surname;
	string phoneNum;
	string city;
	PhoneInfo(string n ="", string sn="", string pn="", string c=""){ // constructor
		name = n;
		surname = sn;
		phoneNum = pn;
		city =c;
	}
	bool operator <(const PhoneInfo& PI)  // created all operators to use this struct in equations
	{
		if (PI.surname == "")
		{
			return name < PI.name;
		}
		return (name+ surname) < (PI.name+ PI.surname);		
	}
	bool operator >(const PhoneInfo& PI)
	{
		if (PI.surname == "")
		{
			return name > PI.name;
		}
		return (name+ surname) > (PI.name+ PI.surname);		
	}
	bool operator ==(const PhoneInfo& PI)
	{
		if (PI.surname == "")
		{
			return name == PI.name;
		}
		return (PI.name+ PI.surname) == (name+ surname);		
	}
	bool operator >=(const PhoneInfo& PI)
	{
		if (PI.surname == "")
		{
			return name >= PI.name;
		}
		return (name+ surname) >= (PI.name+ PI.surname);		
	}
	bool operator <=(const PhoneInfo& PI)
	{
		if (PI.surname == "")
		{
			return name <= PI.name;
		}
		return (name+ surname) <= (PI.name+ PI.surname);		
	}
	bool operator !=(const PhoneInfo& PI)
	{
		if (PI.surname == "")
		{
			return name != PI.name;
		}
		return (name+ surname) != (PI.name+ PI.surname);		
	}
	PhoneInfo operator =(const PhoneInfo& PI)
	{
		name = PI.name;
		surname = PI.surname;
		phoneNum = PI.phoneNum;
		city =PI.city;
		return *this;
	}
	bool findPartialIdx(PhoneInfo PI) // to find partial names is in the name or not
	{
		return name.find(PI.name) == 0; 
	}
};

void to_upper( string & str) { // it is taken from "https://stackoverflow.com/questions/735204/convert-a-string-in-c-to-upper-case?page=1&tab=scoredesc#tab-top" to make strings upper case.
    string::iterator it;
    int i;
    for ( i=0;i<str.size();++i ) {
        ((char *)(void *)str.data())[i]=toupper(((char *)str.data())[i]);
    }
}


void readingFile(string fileName, vector<PhoneInfo> &vec) // the function that reads the file and adding to the vectors
{
	int count = 0;
	PhoneInfo tempPI;
	ifstream in;
	in.open(fileName.c_str());
	string line, word;
	if (in.fail())
	{
		cout << "Error: The file cannot be opened!" << endl;
	}
	else
	{


		while (getline(in, line))
		{
			istringstream iLine(line);
			while (iLine>> word)
			{
				if (count == 0)
				{
					to_upper(word);
					tempPI.name = word;
				}
				else if (count == 1)
				{
					to_upper(word);
					tempPI.surname = word;
				}
				else if (count == 2)
				{
					tempPI.phoneNum = word;
				}
				else if (count == 3)
				{
					tempPI.city = word;
				}
				count++;
			}
			count = 0;
			vec.push_back(tempPI);
		}
	}
}

void quickSortingTime(vector<PhoneInfo> & qVec) // sort time function for insertion sorting
{
	quicksortMain(qVec);
}

void insSortingTime(vector<PhoneInfo> & qVec) // sort time function  for insertion sorting
{
	insSortMain(qVec);

}

void mergeSortingTime(vector<PhoneInfo> & qVec) // sort time function for merge sorting
{
	mergeSortMain(qVec);

}

void heapSortingTime(vector<PhoneInfo> & qVec) // sort time function for heap sorting
{
	heapSort(qVec);

}





// PhoneBook-sample1.txt
int main()
{
	vector<PhoneInfo> outputVec, mainVec, quickVec, insVec, mergeVec, heapVec;
	string contactFile, wordQ, outputWordQ;

	cout << "Please enter the contact file name:" << endl;
	cin>> contactFile;
	cout << "Please enter the word to be queried :" << endl;
	cin >>ws ;
	getline(cin, wordQ);
	readingFile(contactFile, mainVec);

	cout << "Sorting the vector copies" << endl;
	cout << "======================================" <<endl;
	quickVec= insVec= mergeVec= heapVec= mainVec;

	auto start1 = chrono::high_resolution_clock::now();
	quickSortingTime(quickVec); // quicksorting
	auto end1 = chrono::high_resolution_clock::now();
	long long quickTime = std::chrono::duration_cast<std::chrono::nanoseconds>(end1 - start1).count();
	cout << "Quick Sort Time: " << quickTime<< " Nanoseconds" << endl;

	auto start2 = chrono::high_resolution_clock::now();
	insSortingTime(insVec); // insertion sorting
	auto end2 = chrono::high_resolution_clock::now();
	long long insertionTime = std::chrono::duration_cast<std::chrono::nanoseconds>(end2 - start2).count();
	cout << "Insertion Sort Time: " << insertionTime << " Nanoseconds" << endl;

	auto start3 = chrono::high_resolution_clock::now();
	mergeSortingTime(mergeVec); // merge sorting
	auto end3 = chrono::high_resolution_clock::now();
	long long mergeTime = std::chrono::duration_cast<std::chrono::nanoseconds>(end3 - start3).count();
	cout << "Merge Sort Time: " << mergeTime << " Nanoseconds" << endl;

	auto start4 = chrono::high_resolution_clock::now();
	heapSortingTime(heapVec); // heap sorting
	auto end4 = chrono::high_resolution_clock::now();
	long long heapTime = std::chrono::duration_cast<std::chrono::nanoseconds>(end4- start4).count();
	cout << "Heap Sort Time: " << heapTime << " Nanoseconds" << endl;

	PhoneInfo outputInfo;
	int idx = wordQ.find(" ");

	cout << endl<<"Searching for " << wordQ<<endl;
	cout << "======================================" <<endl << endl;
	to_upper(wordQ);

	long long BinaryTime, SequentialTime;

	if (idx != string::npos) // binary search for full name
	{

		auto start4 = chrono::high_resolution_clock::now();
		PhoneInfo wantedQ(wordQ.substr(0, idx),wordQ.substr(idx+1),"","");
		if (binarySearchMain( quickVec, wantedQ ) != -1)
		{
			outputInfo = quickVec[binarySearchMain( quickVec, wantedQ )];
			cout <<outputInfo.name << " " <<outputInfo.surname  << " "<<outputInfo.phoneNum<< " " <<outputInfo.city << endl;
		}
		else
		{
			cout << wordQ << " does NOT exist in the dataset" << endl ;
		}
		auto end4 = chrono::high_resolution_clock::now();
		BinaryTime = std::chrono::duration_cast<std::chrono::nanoseconds>(end4- start4).count();
		cout << "Binary Search Time: " << BinaryTime<< " Nanoseconds" << endl << endl;
	}
	else // binary search for partial name
	{
		auto start4 = chrono::high_resolution_clock::now();
		bool empty = true;
		PhoneInfo wantedQ(wordQ,"","","");

		int idx = binarySearchPartial( quickVec, wantedQ );
		while (idx != -1)
		{

			outputInfo = quickVec[binarySearchPartial( quickVec, wantedQ )];
			cout <<  outputInfo.name << " " <<outputInfo.surname  << " "<<outputInfo.phoneNum<< " " <<outputInfo.city << endl;
			empty = false;
			quickVec.erase(quickVec.begin() + idx);
			idx = binarySearchPartial( quickVec, wantedQ );
		}
		if(empty)
		{
			cout << wordQ << " does NOT exist in the dataset" << endl ;
		}
		auto end4 = chrono::high_resolution_clock::now();
		BinaryTime = std::chrono::duration_cast<std::chrono::nanoseconds>(end4- start4).count();
		cout << "Binary Search Time: " << BinaryTime<< " Nanoseconds" << endl<< endl;
	}
	if (idx != string::npos) //  sequantial search for full name
	{
		cout << "Search results for Sequential Search:" << endl;
		auto start4 = chrono::high_resolution_clock::now();
		PhoneInfo wantedQ(wordQ.substr(0, idx),wordQ.substr(idx+1),"","");
		if (seqSearchMainFull( heapVec, wantedQ ) != -1)
		{
			outputInfo = heapVec[seqSearchMainFull( heapVec, wantedQ )];
			cout << outputInfo.name << " " <<outputInfo.surname  << " "<<outputInfo.phoneNum<< " " <<outputInfo.city << endl;
		}
		else
		{
			cout << wordQ << " does NOT exist in the dataset" << endl ;
		}
		auto end4 = chrono::high_resolution_clock::now();
		SequentialTime = std::chrono::duration_cast<std::chrono::nanoseconds>(end4- start4).count();
		cout <<endl << "Sequential Search Time: " << SequentialTime<< " Nanoseconds" << endl<< endl;
	}
	else // sequantial search for partial name
	{
		auto start4 = chrono::high_resolution_clock::now();
		bool empty = true;
		PhoneInfo wantedQ(wordQ,"","","");
		int idx = seqSearchMainPartial( heapVec, wantedQ );
		cout << "Search results for Sequential Search:" << endl;
		while (idx != -1)
		{

			outputInfo = heapVec[seqSearchMainPartial( heapVec, wantedQ )];
			cout <<  outputInfo.name << " " <<outputInfo.surname  << " "<<outputInfo.phoneNum<< " " <<outputInfo.city << endl;
			empty = false;
			heapVec.erase(heapVec.begin() + idx);
			idx = seqSearchMainPartial( heapVec, wantedQ );
		}
		if(empty)
		{
			cout << wordQ << " does NOT exist in the dataset" << endl ;
		}
		auto end4 = chrono::high_resolution_clock::now();
		SequentialTime = std::chrono::duration_cast<std::chrono::nanoseconds>(end4- start4).count();
		cout << endl << "Sequential Search Time: " << SequentialTime<< " Nanoseconds" << endl<< endl;
	}

	cout << "SpeedUp between Search Algorithms" << endl;
	cout << "======================================" << endl;
	cout << "(Sequential Search/ Binary Search) SpeedUp = " << (double)SequentialTime / BinaryTime<< endl << endl;
	cout << "SpeedUp between Search Algorithms" << endl;
	cout << "======================================" << endl;	

	cout << "(Insertion Sort/ Quick Sort) SpeedUp = " <<  (double)insertionTime/ quickTime <<endl;
	cout << "(Merge Sort / Quick Sort) SpeedUp = "<<  (double) mergeTime/ quickTime <<endl;
	cout << "(Heap Sort / Quick Sort) SpeedUp = " <<   (double)heapTime/ quickTime <<endl;

	return 0;
}