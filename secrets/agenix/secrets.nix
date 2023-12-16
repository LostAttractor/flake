let
  lostattractor = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL2q0QKgzBS1DFGxmMEvzpz1X05GMidvmulyH/pd8zQA lostattractor@gmail.com";
  users = [ lostattractor ];

  CALaptopG14 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEczWrI42AEcSUxgk20d0LcjqV4WO664jcWdwxE2kjmt root@CALaptopG14";
  systems = [ CALaptopG14 ];
in
{
  "./keys/nix-access-tokens.age".publicKeys = users ++ systems;
  "./keys/rathole.age".publicKeys = users ++ systems;
}