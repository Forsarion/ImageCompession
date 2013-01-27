(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 8.0' *)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[       150,          7]
NotebookDataLength[     10794,        261]
NotebookOptionsPosition[     10457,        244]
NotebookOutlinePosition[     10812,        260]
CellTagsIndexPosition[     10769,        257]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell[BoxData[
 RowBox[{"\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"path", " ", "=", " ", 
     RowBox[{"SystemDialogInput", "[", "\"\<FileOpen\>\"", "]"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"image", " ", "=", " ", 
     RowBox[{"Import", "[", "path", "]"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"imageData", " ", "=", " ", 
     RowBox[{"ImageData", "[", 
      RowBox[{"image", ",", "\"\<Byte\>\""}], "]"}]}], ";"}], 
   "\[IndentingNewLine]", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"compressionFunction", " ", "=", " ", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"imageData", ",", "x"}], "}"}], "\[Function]", 
      RowBox[{"(", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"partitionedMatrix", "=", 
         RowBox[{"Partition", "[", 
          RowBox[{"imageData", ",", " ", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"2", "^", "x"}], ",", 
             RowBox[{"2", "^", "x"}], ",", "3"}], "}"}], ",", 
           RowBox[{"2", "^", "x"}], ",", 
           RowBox[{"{", 
            RowBox[{"1", ",", "1"}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"-", "1"}], "}"}]}], "]"}]}], ";", "\[IndentingNewLine]", 
        
        RowBox[{"rgbMatrix", " ", "=", " ", 
         RowBox[{"Flatten", "[", 
          RowBox[{"manipulatedMatrix", ",", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"{", "1", "}"}], ",", 
             RowBox[{"{", "2", "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"3", ",", "6"}], "}"}], ",", 
             RowBox[{"{", "4", "}"}], ",", 
             RowBox[{"{", "5", "}"}]}], "}"}]}], "]"}]}], ";", 
        "\[IndentingNewLine]", "\[IndentingNewLine]", 
        RowBox[{"normalize", "=", 
         RowBox[{"list", " ", "\[Function]", 
          RowBox[{"(", "\[IndentingNewLine]", 
           RowBox[{
            RowBox[{"average", " ", "=", " ", 
             RowBox[{"list", "\[Function]", 
              RowBox[{"Map", "[", 
               RowBox[{
                RowBox[{"row", "\[Function]", 
                 RowBox[{"(", "\[IndentingNewLine]", 
                  RowBox[{"If", "[", 
                   RowBox[{
                    RowBox[{
                    RowBox[{"row", "[", 
                    RowBox[{"[", "1", "]"}], "]"}], "\[NotEqual]", 
                    RowBox[{"-", "1"}]}], ",", 
                    RowBox[{"(", "\[IndentingNewLine]", 
                    RowBox[{
                    RowBox[{"avg", " ", "=", " ", 
                    RowBox[{"row", "[", 
                    RowBox[{"[", "1", "]"}], "]"}]}], ";", 
                    "\[IndentingNewLine]", 
                    RowBox[{"Map", "[", 
                    RowBox[{
                    RowBox[{"item", "\[Function]", "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{"item", " ", "\[NotEqual]", " ", 
                    RowBox[{"-", "1"}]}], ",", "\[IndentingNewLine]", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{"avg", " ", "=", " ", 
                    RowBox[{
                    RowBox[{"(", 
                    RowBox[{"avg", " ", "+", " ", "item"}], ")"}], " ", "/", 
                    " ", "2"}]}], ";", "item"}], ")"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"Round", "@", "avg"}]}], "]"}]}], " ", ",", " ", 
                    "\[IndentingNewLine]", "row"}], "]"}]}], ")"}], ",", 
                    "\[IndentingNewLine]", "row"}], "]"}], ")"}]}], ",", 
                "\[IndentingNewLine]", "list"}], "]"}]}]}], ";", 
            "\[IndentingNewLine]", 
            RowBox[{"result", " ", "=", 
             RowBox[{"average", "[", "list", "]"}]}], ";", 
            "\[IndentingNewLine]", 
            RowBox[{"result", " ", "=", " ", 
             RowBox[{"Flatten", "[", 
              RowBox[{"result", ",", 
               RowBox[{"{", 
                RowBox[{
                 RowBox[{"{", "2", "}"}], ",", 
                 RowBox[{"{", "1", "}"}]}], "}"}]}], "]"}]}], ";", 
            "\[IndentingNewLine]", 
            RowBox[{"result", " ", "=", " ", 
             RowBox[{"average", "[", "result", "]"}]}], ";", 
            "\[IndentingNewLine]", 
            RowBox[{"result", " ", "=", " ", 
             RowBox[{"Flatten", "[", 
              RowBox[{"result", ",", " ", 
               RowBox[{"{", 
                RowBox[{
                 RowBox[{"{", "2", "}"}], ",", 
                 RowBox[{"{", "1", "}"}]}], "}"}]}], "]"}]}], ";", 
            "\[IndentingNewLine]", "result"}], "\[IndentingNewLine]", 
           ")"}]}]}], ";", "\[IndentingNewLine]", 
        RowBox[{"fullfilledMatrix", " ", "=", 
         RowBox[{"Map", "[", 
          RowBox[{"normalize", ",", " ", "rgbMatrix", ",", 
           RowBox[{"{", "3", "}"}]}], "]"}]}], ";", "\[IndentingNewLine]", 
        "\[IndentingNewLine]", 
        RowBox[{"codeFunction", " ", "=", 
         RowBox[{"matrix", "\[Function]", 
          RowBox[{"(", "\[IndentingNewLine]", 
           RowBox[{
            RowBox[{"fourieredMatrix", " ", "=", 
             RowBox[{"FourierDCT", "[", "matrix", "]"}]}], ";", 
            "\[IndentingNewLine]", 
            RowBox[{"roundedMatrix", " ", "=", " ", 
             RowBox[{"Map", "[", 
              RowBox[{"Round", ",", "fourieredMatrix", ",", 
               RowBox[{"{", "2", "}"}]}], "]"}]}], ";", "\[IndentingNewLine]", 
            RowBox[{"signsMatrix", " ", "=", " ", 
             RowBox[{"Map", "[", 
              RowBox[{
               RowBox[{"element", "\[Function]", 
                RowBox[{"(", "\[IndentingNewLine]", 
                 RowBox[{"If", "[", 
                  RowBox[{
                   RowBox[{"element", " ", ">", " ", "0"}], ",", " ", "1", 
                   ",", " ", "0"}], "]"}], "\[IndentingNewLine]", ")"}]}], 
               ",", "fourieredMatrix", ",", " ", 
               RowBox[{"{", "2", "}"}]}], "]"}]}], ";", "\[IndentingNewLine]", 
            RowBox[{"{", 
             RowBox[{"roundedMatrix", ",", "signsMatrix"}], "}"}]}], 
           "\[IndentingNewLine]", ")"}]}]}], ";", "\[IndentingNewLine]", 
        RowBox[{"compressedMatrix", " ", "=", " ", 
         RowBox[{"Map", "[", 
          RowBox[{"codeFunction", ",", " ", "fullfilledMatrix", ",", " ", 
           RowBox[{"{", "3", "}"}]}], "]"}]}], ";", "\[IndentingNewLine]", 
        "\[IndentingNewLine]", 
        RowBox[{"imageSize", " ", "=", " ", 
         RowBox[{"Dimensions", "[", "imageData", "]"}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"result", " ", "=", " ", 
         RowBox[{"{", 
          RowBox[{"imageSize", ",", "compressedMatrix"}], "}"}]}], ";", 
        "\[IndentingNewLine]", "\[IndentingNewLine]", 
        RowBox[{"(*", 
         RowBox[{
          RowBox[{"exportPath", " ", "=", " ", 
           RowBox[{"SystemDialogInput", "[", "\"\<FileSave\>\"", "]"}]}], ";",
           "\[IndentingNewLine]", 
          RowBox[{"Export", "[", 
           RowBox[{"exportPath", ",", "result", ",", "\"\<WDX\>\""}], "]"}], 
          ";"}], "*)"}], "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"partitionedMatrix", "[", 
          RowBox[{"[", 
           RowBox[{"1", ",", "1"}], "]"}], "]"}], "//", "MatrixForm"}]}], 
       "\[IndentingNewLine]", ")"}]}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"Manipulate", "[", 
    RowBox[{
     RowBox[{"compressionFunction", "[", 
      RowBox[{"imageData", ",", "x"}], "]"}], ",", 
     RowBox[{"{", 
      RowBox[{"x", ",", "3", ",", "8", ",", "1", ",", 
       RowBox[{"Appearance", "\[Rule]", "\"\<Open\>\""}]}], "}"}]}], "]"}], 
   "\[IndentingNewLine]"}]}]], "Input",
 CellChangeTimes->CompressedData["
1:eJxTTMoPSmViYGAQBWIQ/aGAUyB06itHgzMlYiCaRW+qKYjmdI41A9GNHDud
QXTDnHZ3EF0y+5YfiK6I1fAH0Vd2FISB6LiXaokgev1UxlQQ3aR2Kw9E3zN/
UQKiXVjVakB05em8BhBdcPDiDBD96eiluSC6rP3zUhB9y0B8A4g+pqAHpps7
2beBaKPb8jtAtM3G4/vA8o94DoHohLWKp0D0rBlKp0G0xek/rw4Bacl5j96B
6BjDwB8gOk5/PZi2u5n0D8zfFc14GEhfNVJmA9Fb+uWFQLSR4XwJEB3yoFYK
RFtcl1EA0Y/OCCmC6DcrptmBaElLZwew/o13AkH0g+Pf40E0AA1PsME=
  "]],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`x$$ = 3, Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{
      Hold[$CellContext`x$$], 3, 8, 1}}, Typeset`size$$ = {
    892., {59.34375, 64.65625}}, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = True, $CellContext`x$128576$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, "Variables" :> {$CellContext`x$$ = 3}, 
      "ControllerVariables" :> {
        Hold[$CellContext`x$$, $CellContext`x$128576$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, 
      "Body" :> $CellContext`compressionFunction[$CellContext`imageData, \
$CellContext`x$$], 
      "Specifications" :> {{$CellContext`x$$, 3, 8, 1, Appearance -> "Open"}},
       "Options" :> {}, "DefaultOptions" :> {}],
     ImageSizeCache->{935., {116., 122.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    SynchronousInitialization->True,
    UnsavedVariables:>{Typeset`initDone$$},
    UntrackedVariables:>{Typeset`size$$}], "Manipulate",
   Deployed->True,
   StripOnInput->False],
  Manipulate`InterpretManipulate[1]]], "Output",
 CellChangeTimes->{
  3.5681794387421618`*^9, 3.568179481884856*^9, 3.568179903660385*^9, {
   3.568179958314394*^9, 3.5681799791178303`*^9}}]
}, Open  ]]
},
WindowSize->{736, 936},
WindowMargins->{{15, Automatic}, {Automatic, 1}},
FrontEndVersion->"8.0 for Mac OS X x86 (32-bit, 64-bit Kernel) (November 6, \
2010)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[572, 22, 8185, 182, 718, "Input"],
Cell[8760, 206, 1681, 35, 255, "Output"]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature nwpa#2olb9UHZAwfrUZ0zsKx *)
