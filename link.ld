SECTIONS
{
  .text 0x20000000 :
  {
		AT(0x20000000)
     *(mysection)
  }
	
	.myosec :
	{
	  *(myisec)
	}
}
