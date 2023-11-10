import { Container } from "../components/Container";

import React from "react";
import Link from "next/link";

export function Hero() {
  return (
    <Container className="pt-20 pb-16 text-center lg:pt-32 -mt-16">
      <h1 className="mx-auto max-w-4xl font-display text-5xl font-medium tracking-tight text-slate-900 sm:text-7xl">
        Secure{" "}
        <span className="relative whitespace-nowrap text-[#7F56D9]">
          <span className="relative">Vesting</span>
        </span>{" "}
        Platform for your Company.
      </h1>

      <div className="mt-10 flex justify-center space-x-6 ">
        <Link
          href="/create"
          className="bg-[#7F56D9] text-white px-4 py-2 rounded-lg"
        >
          Create Company
        </Link>
      </div>
    </Container>
  );
}
