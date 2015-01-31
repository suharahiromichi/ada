package Mathlib is
   function X2(X : Integer) return Integer;
end Mathlib;

package body Mathlib is
   function X2(X : Integer) return Integer is
   begin
      return X * 2;
   end X2;
end Mathlib;
