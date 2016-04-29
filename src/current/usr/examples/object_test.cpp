#include "object_test.h"


class CParent
{
  public:
    CParent()
    {
      printf_("parent constructor\n");
    }

    virtual void process(u32 value)
    {
      printf_("virtual method >>> %u\n", value);
    }
};

class CTestingClass:public CParent
{
  public:
    CTestingClass();
    ~CTestingClass();

    void process(u32 value);
};


CTestingClass::CTestingClass():CParent()
{
  printf_("constructor called\n");
}

CTestingClass::~CTestingClass()
{

}


void CTestingClass::process(u32 value)
{

  u32 i;
  for (i = 0; i < value; i++)
  {
    led_on(LED_1);
    printf_("inside method %u\n", i);
    timer_delay_ms(10);
    led_off(LED_1);

    timer_delay_ms(100);
  }
}

void object_test_call()
{
  class CTestingClass testing_class;

/*
  int *v = new int;

  *v = 13;
*/

  testing_class.process(10);

  // delete v;
}
