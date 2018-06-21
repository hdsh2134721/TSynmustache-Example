program SynMustacheExample;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  SynMustache;

var
  r: string;

function Example1(): string;
const
  Json = '{ "data":"hello"}';
  Data = '{{ data }}';
var
  Mustache: TSynMustache;
begin
  Mustache := TSynMustache.Create(data);
  Result := Mustache.RenderJSON(Json);
  Mustache.Free;
end;

function Example2(): string;
const
  Json = '{ "data":"hello","List":[{"Name":"Hello","Age":30},{"Name":"World","Age":20}]}';
  Data = '{{#List}}我的名字{{Name}},我的年龄{{Age}}' + #10#13 + '{{/List}}';
var
  Mustache: TSynMustache;
begin
  Mustache := TSynMustache.Create(data);
  Result := Mustache.RenderJSON(Json);
  Mustache.Free;
end;

function Example3(): string;
const
  Json = '{ "data":"hello","Show":true,"NotShow":false}';
  Data = ' 如果Show为True' + #10#13 + ' {{#Show}}我就显示{{ data }} {{/Show}}' + #10#13 + '如果NotShow为True' + #10#13 + ' {{#NotShow}}我就显示{{ data }} {{/NotShow}}';
var
  Mustache: TSynMustache;
begin
  Mustache := TSynMustache.Create(data);
  Result := Mustache.RenderJSON(Json);
  Mustache.Free;
end;

function Example4(): string;
const
  Json = '{ "data":"hello","Show":true,"NotShow":false}';
  Data = '修改模板符号{{=<% %>=}} 更改{{ }} <%={{ }}=%>为<% %> {{=<% %>=}} ' + #10#13 + '<%data%>' + #10#13 + '还原回来 <%={{ }}=%>' + #10#13 + '{{data}}';
var
  Mustache: TSynMustache;
begin
  Mustache := TSynMustache.Create(data);
  Result := Mustache.RenderJSON(Json);
  Mustache.Free;
end;

function Example5(): string;
const
  Json = '{ "data":"hello","Show":true,"NotShow":false}';
  Data = '生成GUID:{{NewGUID}}' + #10#13 + '使用if语句:{{#if data="hello"}}如果data为hello,你就能看到我了{{/if}}';
var
  Mustache: TSynMustache;
begin
  Mustache := TSynMustache.Create(data);
  Result := Mustache.RenderJSON(Json, nil, TSynMustache.HelpersGetStandardList);
  Mustache.Free;
end;

begin
  try
    Writeln('Example1-基础变量应用');
    Writeln(Example1);
    Writeln('Example2-循环的例子');
    Writeln(Example2);
    Writeln('Example3-值为True,False变量的另一种用法');
    Writeln(Example3);
    Writeln('Example4-模板中包含{{}}符号,导致替换出问题的解决办法');
    Writeln(Example4);
    Writeln('Example5-使用TSynMustache提供的基础函数');
    Writeln('TSynMustache提供了以下基础函数');
    Writeln('DateTimeToText,DateToText,DateFmt,TimeLogToText,JSONQuote'#10#13',JSONQuoteURI,ToJSON,WikiToHtml,BlobToBase64,EnumTrim'#10#13',EnumTrimRight,PowerOfTwo,Equals,If,NewGUID'#10#13',ExtractFileName,Lower,Upper');
    Writeln('使用前必须注册,我仅使用两个函数演示下.');
    Writeln(Example5);
    Writeln('上述仅是目前我能用到的,如果以后还用到其他的了，我会增加。');
    Writeln('希望通过我的例子你能够快速上手TSynMustache。');

    { TODO -oUser -cConsole Main : Insert code here }
    Readln(r);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
