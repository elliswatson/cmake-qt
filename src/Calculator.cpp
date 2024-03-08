#include "Calculator.hpp"
#include <iostream>
#include <qlineedit.h>
#include <qnamespace.h>
#include <qwidget.h>      

Calculator::Calculator(QWidget *parent)
: QWidget(parent)
{
  display = new QLineEdit("0");
  display->setReadOnly(true);
  display->setAlignment(Qt::Alignment());
  display->setMaxLength(15);
 //
//  std::cout<< "test"<<std::endl;


    
}
