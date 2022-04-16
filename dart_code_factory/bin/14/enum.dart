
enum Status{
  approved,
  rejected,
  pending
}
void main(List<String> args) {
  Status status = Status.approved;
  if(status == Status.approved) { 
    print('승인되었습니다.');
  } else {
    print('승인되지 않았습니다.');
  }
}