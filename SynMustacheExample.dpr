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
  Data = '{{#List}}�ҵ�����{{Name}},�ҵ�����{{Age}}' + #10#13 + '{{/List}}';
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
  Data = ' ���ShowΪTrue' + #10#13 + ' {{#Show}}�Ҿ���ʾ{{ data }} {{/Show}}' + #10#13 + '���NotShowΪTrue' + #10#13 + ' {{#NotShow}}�Ҿ���ʾ{{ data }} {{/NotShow}}';
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
  Data = '�޸�ģ�����{{=<% %>=}} ����{{ }} <%={{ }}=%>Ϊ<% %> {{=<% %>=}} ' + #10#13 + '<%data%>' + #10#13 + '��ԭ���� <%={{ }}=%>' + #10#13 + '{{data}}';
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
  Data = '����GUID:{{NewGUID}}' + #10#13 + 'ʹ��if���:{{#if data="hello"}}���dataΪhello,����ܿ�������{{/if}}';
var
  Mustache: TSynMustache;
begin
  Mustache := TSynMustache.Create(data);
  Result := Mustache.RenderJSON(Json, nil, TSynMustache.HelpersGetStandardList);
  Mustache.Free;
end;

begin
  try
    Writeln('Example1-��������Ӧ��');
    Writeln(Example1);
    Writeln('Example2-ѭ��������');
    Writeln(Example2);
    Writeln('Example3-ֵΪTrue,False��������һ���÷�');
    Writeln(Example3);
    Writeln('Example4-ģ���а���{{}}����,�����滻������Ľ���취');
    Writeln(Example4);
    Writeln('Example5-ʹ��TSynMustache�ṩ�Ļ�������');
    Writeln('TSynMustache�ṩ�����»�������');
    Writeln('DateTimeToText,DateToText,DateFmt,TimeLogToText,JSONQuote'#10#13',JSONQuoteURI,ToJSON,WikiToHtml,BlobToBase64,EnumTrim'#10#13',EnumTrimRight,PowerOfTwo,Equals,If,NewGUID'#10#13',ExtractFileName,Lower,Upper');
    Writeln('ʹ��ǰ����ע��,�ҽ�ʹ������������ʾ��.');
    Writeln(Example5);
    Writeln('��������Ŀǰ�����õ���,����Ժ��õ��������ˣ��һ����ӡ�');
    Writeln('ϣ��ͨ���ҵ��������ܹ���������TSynMustache��');

    { TODO -oUser -cConsole Main : Insert code here }
    Readln(r);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

