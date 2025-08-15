//---------------------------------
//  Design code
//---------------------------------

module mod3 ([ports_list]);
    reg c;
    
endmodule
    
    module mod4 ([ports_list]);
        wire a;
        
    endmodule
        
        module mod1 ([ports_list]);
            wire y;
            
            mod3 mod_insist1();
            mod3 mod_insist2();
        endmodule
            
            module mod2 ([ports_list]);
                mod4 mod_insist1();
                mod4 mod_insist2();
            endmodule
                
                // Top-level module
                module design ([ports_list]);
                    wire _net;
                    
                    mod1 mod_insist1();
                    mod2 mod_insist2();
                    
                endmodule
