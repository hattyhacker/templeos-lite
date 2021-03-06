/*
public U0 DrawStdMs(CDC *dc,I64 x,I64 y)
{//This is a callback. See $LK,"::/Demo/Graphics/Grid.HC"$.
//Called by $LK,"DrawMs",A="MN:DrawMs"$() which is
  //called by $LK,"WinFinalUpdate",A="MN:WinFinalUpdate"$().
  dc->thick=1;
  dc->flags&=~(DCF_TRANSFORMATION|DCF_SYMMETRY);
  GrArrow3(dc,x+8,y+8,0,x,y,0);
}
*/

public U0 DrawTriMs(CDC *dc,I64 x,I64 y)
{//This is a callback.
//Called by $LK,"DrawMs",A="MN:DrawMs"$() which is
  //called by $LK,"WinFinalUpdate",A="MN:WinFinalUpdate"$().
  

  $SP,"<1>",BI=1$

  Sprite3(dc,x,y,1,$IB,"<1>",BI=1$);
}


public U0 MouseSet(U8 cursorNum=0) {
  switch (cursorNum) {
    case 1:
      gr.fp_draw_ms=&DrawTriMs;
      break;
    default:
      gr.fp_draw_ms=&DrawStdMs;
      break;
    }
}
        3                     
      
                  