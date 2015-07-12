using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;

namespace Liberty.Tests
{
    [TestFixture]
    public class MiscTests
    {
        [SetUp]
        public void Setup()
        { 
            //do stuff
        }

        [Test]
        public void Should_Do_Something()
        {
            Func<int, bool> isMultipleOf2 = x => x % 2 == 0;

            int numb1 = 4;
            int numb2 = 23;

            Assert.That(isMultipleOf2(numb1), Is.False);
            Assert.That(isMultipleOf2(numb2), Is.False);
        }
    }
}
