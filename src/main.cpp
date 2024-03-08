#include <iostream>
#include "demo.h"
#include "QWidget"
#include <QtWidgets/QApplication>
#include "spdlog/spdlog.h"
#include <nlohmann/json.hpp>
#include <fstream>
#include <ostream>
#include "Calculator.hpp"
using json = nlohmann::json;


int main (int argc, char *argv[]) {
 
  demo d;
  d.carname = "helloworld";
  std::cout<<d.carname<<std::endl;
  spdlog::info("Welcome to spdlog!");
  
  std::ifstream f("example.json");
  json j;
  f >> j;

  float pi = j.at("pi");


 // std::cout<< pi <<std::endl;  
  std::cout << "hello world" << std::endl; 
  QApplication a(argc ,argv);
  
  std::cout<<"change test"<< std::endl;
  QWidget window;
  window.resize(600,600);
  window.show();
  window.setWindowTitle(QApplication::translate("toplevel","Top-level widget"));
  return a.exec();

  }
