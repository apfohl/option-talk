%title: Option<T> - Using monads in C#
%author: Andreas Pfohl (GitHub: @apfohl / Twitter: @andreaspfohl)
%date: 2021-01-22

-> # Option<T> <-

-> How to use monads in C# <-

---

> The monadic curse is that once someone learns
> what monads are and how to use them, they lose
> the ability to explain them to other people.

— Douglas Crockford

---

> … a monad … is just a monoid
> in the category of endofunctors …

— Saunders Mac Lane

---

# Example

```
public interface IStarWarsApi {
    Task<Person> Person(int number);
    Task<Film> Film(int number);
}

public sealed class Person {
    public string Name { get; }
    public IEnumerable<int> Films { get; }
}

public sealed class Film {
    public string Title { get; }
}
```

---

# What problems are we trying to solve?

^
- Context
^
- Composition
^
- Side effects
^
- NULL
