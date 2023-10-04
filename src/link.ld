ENTRY(mystart)

SECTIONS
{
  .text 0x20000000 :
  {
    AT(0x20000000)
    *(.text)
  }	
}
