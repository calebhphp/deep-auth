<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
            @if (! auth()->user()->hasVerifiedEmail())
            <div class="mb-4 rounded bg-yellow-100 p-4 text-sm text-yellow-800">
                Seu e-mail ainda não foi verificado.
                <form method="POST" action="{{ route('verification.send') }}" class="inline">
                    @csrf
                    <button class="underline font-semibold">Reenviar verificação</button>
                </form>
            </div>
            @endif
                <div class="p-6 text-gray-900">
                    {{ __("You're logged in!") }}
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
