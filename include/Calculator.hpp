#ifndef CALCULATOR_H
#define CALCULATOR_H
#include "QWidget"
#include <qlineedit.h>

class Calculator : public QWidget
{

  public:
  Calculator(QWidget *parent =nullptr);

  private slots:
  void digitClicked();
  

  private :
  

 QLineEdit *display;
};


#endif // !CALCULATOR
#define CALCULATOR



