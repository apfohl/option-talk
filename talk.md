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
public interface IApi {
    Person FindPerson(string name);
    Lightsaber FindLightsaber(int id);
}

public sealed class Person {
    public string Name { get; }
    public int Lightsaber { get; }
}

public sealed class Lightsaber {
    public int Id { get; }
    public string Color { get; }
}
```

---

# Example

```
var person = Api.FindPerson("Luke Skywalker");
     
if (person != null)
{
    var lightsaber =
        Api.FindLightsaber(person.Lightsaber);
     
    Console.WriteLine(lightsaber != null
        ? lightsaber.Color
        : "Lightsaber not found!");
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

^
-> ## -> Monads <-

---

# What exactly is a monad?

^
- Generic Type (Monad<T>)
^
- Container for your values
^
- Immutable
^
- Easy to get in and hard to get out
^
- Always defined state
^
- Methods to work consistent and
safely with contained values

---

# Simplest definition

^
## Type

- Struct or Class

^
## Creating a monad instance

- Constructor

^
## Bind the value

- A method to map the contained
value to a new monad instance

---

# Introducing Monad<T>

    public readonly struct Monad<T> {
^
      
        private readonly T instance;
^
      
        public Monad(T instance)
            => this.instance = instance;
^
      
        public Monad<TResult> Bind<TResult>(Func<T, Monad<TResult>> f)
            => f(instance);
      
    }

