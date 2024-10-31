class packet;

    rand bit [3:0]a;
	rand bit [3:0]b;
	randc bit sel;
	bit  [3:0]f;
	
	
	
	
	constraint cons{a>5;b>5;}
	
	endclass
