//
//  DynamicViewModel.swift
//  TicTacToe
//
//  Created by Xaver Gruber on 02.12.22.
//
import SwiftUI
var t=5


/*
class ValueViewModel<T> : INotifyPropertyChanged
{
    private T _value;
    public T Value
    {
        get { return _value;}
        set
        {
            _value = value;
            RaisePropertyChanged("Value");
        }
    }
}


class PersonViewModel
{
    private Person OriginalModel { get; set; }

    public ValueViewModel<string> Name { get; set; }
    public ValueViewModel<int> Postcode { get; set; }

    protected void ReadFromModel(Person person)
    {
        OriginalModel = person;
        Name.Value = OriginalModel.Name;
        Postcode.Value = OriginalModel.Postcode;
    }


    protected Person WriteToModel()

    {
        OriginalModel.Name = Name.Value;
        return OriginalModel;
    }
}


*/
